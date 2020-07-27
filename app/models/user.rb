class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable
  
  has_many :users_roles
  has_many :roles, through: :users_roles

  def role?(role)
    roles.any? { |r| r.slug.underscore.to_sym == role }
  end
end
