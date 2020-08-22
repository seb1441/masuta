class CheckoutReflex < ApplicationReflex
  def create
    @stripe_product = StripeProduct.find(element.dataset[:product_id])

    lessons_count = element.value.to_i

    session = StripeCheckoutSession.create(product: @stripe_product, user: current_user, lessons_count: lessons_count)

    @stripe_checkout_session_id = session["id"]
    @stripe_publishable_key = Rails.application.credentials.stripe[:publishable_key]

    @price = lessons_count * 20.0
  end
end
