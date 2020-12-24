# == Schema Information
#
# Table name: testimonials
#
#  id         :bigint           not null, primary key
#  date       :date
#  image_path :string
#  message    :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Testimonial < ApplicationRecord
end
