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
require "test_helper"

class ChapterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
