class ApplicationMailer < ActionMailer::Base
  default from: "Masuta <#{Rails.application.credentials.mailer_from_email}>"
  layout "mailer"
end
