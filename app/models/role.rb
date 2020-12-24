# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord
  validates :slug, uniqueness: true, presence: true
end
