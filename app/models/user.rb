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
class User < ApplicationRecord
  # Include default devise modules. Others available are: :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

  has_many :users_roles, dependent: :destroy
  has_many :roles, through: :users_roles
  has_many :user_lessons, dependent: :destroy

  belongs_to :stripe_customer, optional: true

  after_create :add_default_role

  def role?(role)
    roles.exists?(slug: role)
  end

  def add_default_role
    roles << Role.find_by_slug("student")
  end

  def full_name
    [first_name, last_name].compact.join(" ")
  end
end
