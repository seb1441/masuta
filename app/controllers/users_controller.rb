class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admin_area, only: [:show, :index]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])

    user_chat_rooms = ChatRoom.joins(:chat_participants).where(chat_participants: { user: @user })

    @chat_room = user_chat_rooms.find_all { |room| room.chat_participants.any? { |participant| participant.user == current_user } }.first

    unless @chat_room
      @chat_room = ChatRoom.create
      @chat_room.chat_participants.create user: current_user
      @chat_room.chat_participants.create user: @user
    end
  end
end
