class CheckoutReflex < ApplicationReflex
  def create
    @stripe_product = StripeProduct.find(element.dataset[:product_id])

    lessons_count = element.value.to_i

    session = Stripe::Checkout::Session.create(
      success_url: Rails.application.routes.url_helpers.stripe_product_url(@stripe_product, session_id: "{CHECKOUT_SESSION_ID}"),
      cancel_url: Rails.application.routes.url_helpers.stripe_product_url(@stripe_product),
      payment_method_types: ["card"],
      mode: "payment",
      line_items: [{
        quantity: lessons_count,
        price: Rails.application.credentials.stripe[:price_id]
      }]
    )
    current_user.update(temporary_stripe_checkout_session_id: session["id"])

    @stripe_checkout_session_id = session["id"]
    @stripe_publishable_key = Rails.application.credentials.stripe[:publishable_key]

    @price = lessons_count * 20.0
  end
end
