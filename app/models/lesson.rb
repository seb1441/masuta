class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :level
  belongs_to :chapter
end
