class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def lessons
  end

  def reviews
  end

  def trial
  end

  def my_teacher
    set_admin_area
    @user = User.first # TODO: Update here to always be Yuki's user. Change her email to wwwdtad@gmail.com
  end
end
