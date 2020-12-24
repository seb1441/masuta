# == Schema Information
#
# Table name: contact_messages
#
#  id         :bigint           not null, primary key
#  email      :string
#  message    :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ContactMessage < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Email invalid"}, length: {minimum: 4, maximum: 254}
  validates :message, presence: true, allow_blank: false

  def send_email
    UserMailer.unauthenticated_contact(name: name, email: email, message: message).deliver_later
  end
end
