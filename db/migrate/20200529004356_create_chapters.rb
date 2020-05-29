class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :description
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
