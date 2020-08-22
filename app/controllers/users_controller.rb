class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admin_area, only: [:show, :index]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @chat_messages = ChatMessage.includes(:sender, :receiver).where(sender: current_user, receiver: @user).or(ChatMessage.where(receiver: current_user, sender: @user))
  end
end
