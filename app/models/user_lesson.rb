# == Schema Information
#
# Table name: user_lessons
#
#  id                       :bigint           not null, primary key
#  scheduled_date           :datetime
#  status                   :integer
#  trial                    :boolean          default(FALSE)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  stripe_payment_intent_id :string
#  user_id                  :bigint           not null
#
# Indexes
#
#  index_user_lessons_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserLesson < ApplicationRecord
  belongs_to :user
  enum status: {
    pending: 0,
    scheduled: 1,
    completed: 2,
    cancelled: 3
  }, _default: :pending
end
