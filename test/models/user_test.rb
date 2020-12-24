# == Schema Information
#
# Table name: users
#
#  id                                   :bigint           not null, primary key
#  comments                             :string
#  confirmation_sent_at                 :datetime
#  confirmation_token                   :string
#  confirmed_at                         :datetime
#  convenient_hours                     :string
#  convenient_weekdays                  :string
#  current_sign_in_at                   :datetime
#  current_sign_in_ip                   :inet
#  email                                :string           default(""), not null
#  encrypted_password                   :string           default(""), not null
#  failed_attempts                      :integer          default(0), not null
#  first_name                           :string
#  last_name                            :string
#  last_sign_in_at                      :datetime
#  last_sign_in_ip                      :inet
#  lesson_minutes                       :integer          default(0)
#  level                                :string
#  locked_at                            :datetime
#  note                                 :string
#  remember_created_at                  :datetime
#  reset_password_sent_at               :datetime
#  reset_password_token                 :string
#  sign_in_count                        :integer          default(0), not null
#  timezone                             :string
#  unconfirmed_email                    :string
#  unlock_token                         :string
#  username                             :string
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#  skype_id                             :string
#  stripe_customer_id                   :string
#  temporary_stripe_checkout_session_id :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_stripe_customer_id    (stripe_customer_id)
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (stripe_customer_id => stripe_customers.id)
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
