class Api::StripeWebhookEventsController < Api::ApplicationController
  def create
    # TODO: Make sure that all this action is repeatable if it errors out so that it doesn't for example add multiple times 50 minutes
    verify_signature

    stripe_webhook_event = StripeWebhookEvent.create(event_type: params["type"], data: params)

    object_data = stripe_webhook_event.data.dig("data", "object")
    case stripe_webhook_event.event_type
    when "customer.created"
      StripeCustomer.create(object_data)
    when "customer.updated"
      StripeCustomer.find(object_data["id"]).update(object_data)
    when "customer.deleted"
      StripeCustomer.find(object_data["id"]).destroy
    when "checkout.session.completed"
      stripe_customer_id = object_data["customer"]
      session_id = object_data["id"]
      if (user = User.find_by(temporary_stripe_checkout_session_id: session_id))
        quantity = Stripe::Checkout::Session.list_line_items(session_id, {limit: 1}).data.first.quantity
        quantity.times do
          user.user_lessons.find_or_initialize_by(stripe_payment_intent_id: object_data["payment_intent"])
        end
        user.stripe_customer_id = stripe_customer_id
        user.temporary_stripe_checkout_session_id = nil
        user.save
        UserMailer.bought_lesson(name: user.full_name, email: user.email, lesson_count: quantity).deliver_now
      end
    when "product.created"
      object_data["s_type"] = object_data.delete("type") # Should not name a column "type" in Rails
      object_data["s_attributes"] = object_data.delete("attributes") # Should not name a column "attributes" in Rails
      StripeProduct.create(object_data)
    when "product.updated"
      StripeProduct.find(object_data["id"]).update(object_data)
    when "product.deleted"
      StripeProduct.find(object_data["id"]).destroy
    when "price.created"
      StripeServices::ImportProduct.new(object_data).call
    when "price.updated"
      StripePrice.find(object_data["id"]).update(object_data)
    when "price.deleted"
      StripePrice.find(object_data["id"]).destroy
    end

    render status: 200, json: {}
  end

  private

  def verify_signature
    sig_header = request.env["HTTP_STRIPE_SIGNATURE"]
    endpoint_secret = Rails.application.credentials.stripe[:webhook_secret]
    payload = request.body.read
    Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
  end
end
