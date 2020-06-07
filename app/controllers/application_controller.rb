class ApplicationController < ActionController::Base
  def set_admin_area
    redirect_to pages_home_path unless current_user.role? :admin
    @admin_area = true
  end
end
