class StripeCustomer < ApplicationRecord
  has_one :user, dependent: :nullify
end
