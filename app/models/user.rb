class User < ApplicationRecord
  # Include default devise modules. Others available are: :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

  has_many :users_roles, dependent: :destroy
  has_many :roles, through: :users_roles
  has_many :scheduled_lessons, dependent: :destroy

  belongs_to :stripe_customer, optional: true

  after_create :add_default_role

  def role?(role)
    roles.exists?(slug: role)
  end

  def add_default_role
    roles << Role.find_by_slug("student")
  end
end
