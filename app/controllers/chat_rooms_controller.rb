class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.find(params[:id])
    @chat_messages = @chat_room.chat_messages.order(:created_at)
  end
end
