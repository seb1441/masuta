class StripeProduct < ApplicationRecord
  has_many :stripe_prices, dependent: :destroy
end
