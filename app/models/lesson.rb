class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :level
  belongs_to :chapter
  has_rich_text :content

  # scope :search, ->(query) {
  #   query = sanitize_sql_like(query)
  #   where(arel_table[:title].matches("%#{query}%"))
  #     .or(where(Category.arel_table[:title].matches("%#{query}%")))
  # }
end
