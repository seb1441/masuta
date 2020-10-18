class Users::ProfilesController
  def update
    user = User.find(params[:id])
    respond_to do |format|
      if user.update(user_params)
        format.html { redirect_to edit_user_registration_path, notice: "Successfully updated." }
      else
        format.html { render "users/registrations/edit" }
      end
    end
  end

  def show
    @profile = User.first
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :country, :convenient_weekdays, :convenient_hours, :skype_id, :level)
  end
end