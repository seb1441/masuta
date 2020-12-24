# == Schema Information
#
# Table name: levels
#
#  id          :bigint           not null, primary key
#  description :text
#  position    :integer          default(0)
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Level < ApplicationRecord
end
