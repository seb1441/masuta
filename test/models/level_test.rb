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
require "test_helper"

class LevelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
