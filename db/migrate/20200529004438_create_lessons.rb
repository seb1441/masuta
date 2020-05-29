class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.references :level, null: false, foreign_key: true
      t.references :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
