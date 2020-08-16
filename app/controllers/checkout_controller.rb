class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admin_area

  def index
    # TODO: Need to add customer(param: customer) ID if current user has a stripe customer id attached to it
    # Also need to create StripeCustomer model to store stripe customer info and not have to query stripe every time?
    session = Stripe::Checkout::Session.create(
      success_url: url_for(controller: "checkout", action: "success", session_id: "{CHECKOUT_SESSION_ID}").gsub("%7B", "{").gsub("%7", "}"),
      cancel_url: url_for(controller: "checkout", action: "cancel"),
      payment_method_types: ["card"],
      mode: "payment",
      line_items: [{
        quantity: 1,
        price: Rails.application.credentials.stripe[:price_id]
      }]
    )

    @stripe_checkout_session_id = session["id"]
    @stripe_publishable_key = Rails.application.credentials.stripe[:publishable_key]
  end

  # TO REMOVE SUCCESS AND CANCEL ACTION ONCE FOUND A RESTFUL WAY TO HANDLE THIS
  def success
  end
end
