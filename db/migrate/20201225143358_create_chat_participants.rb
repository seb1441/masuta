class CreateChatParticipants < ActiveRecord::Migration[6.2]
  def change
    create_table :chat_participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
