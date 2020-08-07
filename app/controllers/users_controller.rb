class UsersController < ApplicationController
  before_action :set_admin_area, only: [:index]

  def index
    @users = User.all
  end
end
