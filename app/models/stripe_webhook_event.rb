# == Schema Information
#
# Table name: stripe_webhook_events
#
#  id         :bigint           not null, primary key
#  data       :jsonb            not null
#  event_type :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class StripeWebhookEvent < ApplicationRecord
  validates :data, presence: true
end
