class UpdateChatMessages < ActiveRecord::Migration[6.2]
  def change
    remove_column :chat_messages, :sender_id, :integer
    remove_column :chat_messages, :receiver_id, :integer
    add_reference :chat_messages, :user, foreign_key: true
    add_reference :chat_messages, :chat_room, foreign_key: true
  end
end
