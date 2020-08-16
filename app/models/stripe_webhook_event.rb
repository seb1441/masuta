class StripeWebhookEvent < ApplicationRecord
  validates :status, presence: true
  validates :data, presence: true
  enum status: [:pending, :in_progress, :processed], _default: :pending
end
