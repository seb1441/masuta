# == Schema Information
#
# Table name: chat_messages
#
#  id           :bigint           not null, primary key
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  chat_room_id :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_chat_messages_on_chat_room_id  (chat_room_id)
#  index_chat_messages_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (chat_room_id => chat_rooms.id)
#  fk_rails_...  (user_id => users.id)
#
class ChatMessage < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user

  broadcasts_to :chat_room

  # broadcasts_to :user
  # broadcasts
  # after_create_commit -> { broadcast_append_to : }
  # after_destroy_commit -> { broadcast_remove_to ticket }
  # after_update_commit -> { broadcast_replace_to ticket }
end
