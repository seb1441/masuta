# == Schema Information
#
# Table name: stripe_customers
#
#  id                    :string           not null, primary key
#  address               :jsonb
#  balance               :integer
#  created               :integer
#  currency              :string
#  default_source        :string
#  delinquent            :boolean
#  description           :text
#  discount              :jsonb
#  email                 :string
#  invoice_prefix        :string
#  invoice_settings      :jsonb
#  livemode              :boolean
#  metadata              :jsonb
#  name                  :string
#  next_invoice_sequence :integer
#  object                :string
#  phone                 :string
#  preferred_locales     :string           is an Array
#  shipping              :jsonb
#  sources               :jsonb
#  subscriptions         :jsonb
#  tax_exempt            :string
#  tax_ids               :jsonb
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class StripeCustomer < ApplicationRecord
  has_one :user, dependent: :nullify
end
