class Role < ApplicationRecord
  validates :slug, uniqueness: true, presence: true
end
