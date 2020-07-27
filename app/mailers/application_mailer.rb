class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.mailer_email
  layout 'mailer'
end
