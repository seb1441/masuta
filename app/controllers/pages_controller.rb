class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def trial
  end

  def my_teacher
    set_admin_area
    @user = User.first # TODO: Update here to always be Yuki's user. Change her email to wwwdtad@gmail.com
  end
end
