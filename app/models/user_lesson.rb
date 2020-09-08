class UserLesson < ApplicationRecord
  belongs_to :user
  enum status: {
    pending: 0,
    scheduled: 1,
    completed: 2,
    cancelled: 3
  }, _default: :pending
end
