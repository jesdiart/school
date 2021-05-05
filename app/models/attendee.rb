class Attendee < ApplicationRecord
  belongs_to :subject
  belongs_to :user, foreign_key: 'student_id'
  validates :subject, uniqueness: { scope: :user }
end
