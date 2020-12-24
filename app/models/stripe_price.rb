# == Schema Information
#
# Table name: stripe_prices
#
#  id                  :string           not null, primary key
#  active              :boolean
#  billing_scheme      :string
#  created             :integer
#  currency            :string
#  livemode            :boolean
#  lookup_key          :string
#  metadata            :jsonb
#  nickname            :string
#  object              :string
#  recurring           :jsonb
#  s_type              :string
#  tiers_mode          :string
#  transform_quantity  :jsonb
#  unit_amount         :integer
#  unit_amount_decimal :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  stripe_product_id   :string           not null
#
# Indexes
#
#  index_stripe_prices_on_stripe_product_id  (stripe_product_id)
#
# Foreign Keys
#
#  fk_rails_...  (stripe_product_id => stripe_products.id)
#
class StripePrice < ApplicationRecord
  belongs_to :stripe_product
end
