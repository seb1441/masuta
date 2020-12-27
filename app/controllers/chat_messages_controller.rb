class ChatMessagesController < ApplicationController
  def new
    # user = User.find(params[:user_id])
    room = current_user.chat_rooms.find(params[:chat_room_id])
    # room = ChatRoom.find(:chat_room_id)

    @chat_message = room.chat_messages.new(user: current_user)
  end

  def create
    @chat_message = ChatMessage.create(chat_message_params)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to :root }
    end
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:user_id, :chat_room_id, :content)
  end
end
