class StripeProductsController < ApplicationController
  before_action :authenticate_user!

  def show
    # TODO: MAKE BELOW CODE REUSABLE FOR THE REFLEX
    return if @stripe_product
    @stripe_product = StripeProduct.find(params[:id])

    session = Stripe::Checkout::Session.create(
      success_url: Rails.application.routes.url_helpers.checkout_success_url,
      cancel_url: Rails.application.routes.url_helpers.checkout_cancel_url,
      payment_method_types: ["card"],
      mode: "payment",
      line_items: [{
        quantity: 1,
        price: Rails.application.credentials.stripe[:price_id]
      }]
    )
    current_user.update(temporary_stripe_checkout_session_id: session["id"])

    @stripe_checkout_session_id = session["id"]
    @stripe_publishable_key = Rails.application.credentials.stripe[:publishable_key]

    @price = 20.0
  end
end
