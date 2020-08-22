class StripeProductsController < ApplicationController
  before_action :authenticate_user!

  def show
    # TODO: MAKE BELOW CODE REUSABLE FOR THE REFLEX
    return if @stripe_product
    @stripe_product = StripeProduct.find(params[:id])

    session = StripeCheckoutSession.create(product: @stripe_product, user: current_user)

    @stripe_checkout_session_id = session["id"]
    @stripe_publishable_key = Rails.application.credentials.stripe[:publishable_key]

    @price = 20.0
  end
end
