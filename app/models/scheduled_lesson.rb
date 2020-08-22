class ScheduledLesson < ApplicationRecord
  belongs_to :user
  enum status: {
    scheduled: 0,
    completed: 1,
    cancelled: 2
  }, _default: :scheduled
end
