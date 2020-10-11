class UserMailer < ApplicationMailer
  def unauthenticated_contact(name:, email:, message:)
    @name = name
    @email = email
    @message = message
    mail(to: Rails.application.credentials.mailer_email, subject: "Contact Page Message")
  end

  def bought_lesson(name:, email:, lesson_count:)
    @name = name
    @email = email
    @lesson_count = lesson_count
    mail(to: email, subject: "Masuta - Lesson bought")
  end
end
