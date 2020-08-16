class Api::StripeWebhookEventsController < Api::ApplicationController
  def create
    verify_signature

    stripe_webhook_event = StripeWebhookEvent.create(event_type: params["type"], data: params)

    case stripe_webhook_event.event_type
    when "customer.created"
      StripeCustomer.create(stripe_webhook_event.data.dig("data", "object"))
    end
    #1. set credentials for dev and dev with rails credentials:edit --environment production (NOT rails credentials:edit)
    #2. deploy
    #3. test if it works on prod with real webhook endpoint https://dashboard.stripe.com/test/webhooks

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
