class RenameTableScheduledLessonsToUserLessons < ActiveRecord::Migration[6.1]
  def up
    change_column :scheduled_lessons, :trial, :boolean, default: false
    add_column :scheduled_lessons, :stripe_payment_intent_id, :string
    rename_table :scheduled_lessons, :user_lessons
  end

  def down
    change_column :user_lessons, :trial, :boolean
    remove_column :user_lessons, :stripe_payment_intent_id, :string
    rename_table :user_lessons, :scheduled_lessons
  end
end
