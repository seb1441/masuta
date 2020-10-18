class UserLessonsController < ApplicationController
  def create
    current_user.update(user_params)
    UserMailer.user_trial(name: current_user.full_name, email: current_user.email).deliver_now
    UserMailer.teacher_trial(user: current_user).deliver_now

    redirect_to "/", notice: "Trial successfully requested!"
  end

  def user_params
    params.require(:user_lesson).permit(:first_name, :last_name, :timezone, :convenient_weekdays, :convenient_hours, :skype_id, :level, :comments)
  end
end
