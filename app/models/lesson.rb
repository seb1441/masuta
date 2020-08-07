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

  def self.enhance_column(column_name, title: nil)
    @enhanced_columns ||= []
    @enhanced_columns.push EnhancedColumn.new(name: column_name, title: title)
  end

  class << self
    attr_reader :enhanced_columns
  end

  enhance_column :category_id, title: "Category"
end
