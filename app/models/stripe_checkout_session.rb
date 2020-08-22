class StripeCheckoutSession
  def self.create(product:, user:, lessons_count: 1)
    session = Stripe::Checkout::Session.create(
      success_url: Rails.application.routes.url_helpers.stripe_product_url(product, session_id: "{CHECKOUT_SESSION_ID}"),
      cancel_url: Rails.application.routes.url_helpers.stripe_product_url(product),
      payment_method_types: ["card"],
      customer: user.stripe_customer_id,
      mode: "payment",
      line_items: [{
        quantity: lessons_count,
        price: Rails.application.credentials.stripe[:price_id]
      }]
    )

    user.update(temporary_stripe_checkout_session_id: session["id"])

    session
  end
end