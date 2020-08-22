class StripeWebhookEvent < ApplicationRecord
  validates :data, presence: true
end
