class UserMailer < ApplicationMailer
  def unauthenticated_contact(name:, email:, message:)
    @name = name
    @email = email
    @message = message
    mail(to: Rails.application.credentials.mailer_email, subject: "Contact Page Message")
  end
end
