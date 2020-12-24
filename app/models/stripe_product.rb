# == Schema Information
#
# Table name: stripe_products
#
#  id                   :string           not null, primary key
#  active               :boolean
#  created              :integer
#  description          :text
#  images               :string           is an Array
#  livemode             :boolean
#  metadata             :jsonb
#  name                 :string
#  object               :string
#  s_attributes         :string           is an Array
#  s_type               :string
#  statement_descriptor :string
#  unit_label           :string
#  updated              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class StripeProduct < ApplicationRecord
  has_many :stripe_prices, dependent: :destroy
end
