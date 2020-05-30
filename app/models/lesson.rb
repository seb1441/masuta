class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :level
  belongs_to :chapter
  has_rich_text :content
end
