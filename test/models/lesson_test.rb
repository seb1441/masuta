# == Schema Information
#
# Table name: lessons
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  chapter_id  :bigint           not null
#  level_id    :bigint           not null
#
# Indexes
#
#  index_lessons_on_category_id  (category_id)
#  index_lessons_on_chapter_id   (chapter_id)
#  index_lessons_on_level_id     (level_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (chapter_id => chapters.id)
#  fk_rails_...  (level_id => levels.id)
#
require "test_helper"

class LessonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
