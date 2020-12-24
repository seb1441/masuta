# == Schema Information
#
# Table name: imports
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Import < ApplicationRecord
  has_one_attached :file
end
