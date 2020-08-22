class CreateScheduledLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :scheduled_lessons do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :trial
      t.integer :status
      t.datetime :scheduled_date

      t.timestamps
    end
  end
end
