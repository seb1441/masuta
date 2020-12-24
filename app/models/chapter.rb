# == Schema Information
#
# Table name: chapters
#
#  id          :bigint           not null, primary key
#  description :text
#  position    :integer          default(0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Chapter < ApplicationRecord
end
