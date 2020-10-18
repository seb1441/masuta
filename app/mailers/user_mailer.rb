class UserMailer < ApplicationMailer
  def unauthenticated_contact(name:, email:, message:)
    @name = name
    @email = email
    @message = message
    mail(to: Rails.application.credentials.mailer_email, subject: "Contact Page Message")
  end

  def bought_lesson(name:, email:, lesson_count:)
    @name = name # TODO: Use or remove this variable
    @lesson_count = lesson_count
    mail(to: email, subject: "Masuta - Lesson bought")
  end

  def user_trial(name:, email:)
    @name = name
    @email = email
    mail(to: email, subject: "Masuta - Trial")
  end

  def teacher_trial(user:)
    @user = user
    mail(to: Rails.application.credentials.mailer_email, subject: "Masuta - Trial")
  end
end
