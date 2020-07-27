class ContactMailer < ApplicationMailer
  def welcome_email
    # mail(to: "sebastien.auriault@hey.com",
    mail(to: "sebastien@diffagency.com",
         body: "GGGGGGGGGGGGGGGGGG",
         content_type: "text/html",
         subject: "Already rendered!")
  end
end
