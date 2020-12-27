class CreateChatRooms < ActiveRecord::Migration[6.2]
  def change
    create_table :chat_rooms do |t|

      t.timestamps
    end
  end
end
