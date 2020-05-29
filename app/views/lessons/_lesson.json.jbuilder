json.extract! lesson, :id, :title, :description, :category_id, :level_id, :chapter_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
