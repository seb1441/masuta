class UsersRole < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates :user, uniqueness: { scope: :role }
end
