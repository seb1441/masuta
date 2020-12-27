# == Schema Information
#
# Table name: chat_participants
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  chat_room_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_chat_participants_on_chat_room_id  (chat_room_id)
#  index_chat_participants_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (chat_room_id => chat_rooms.id)
#  fk_rails_...  (user_id => users.id)
#
class ChatParticipant < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  has_many :chat_messages
end
