class Subject < ApplicationRecord
  has_many :seminars, dependent: :destroy
  has_many :teachers, through: :seminars, source: :user
  has_many :attendees, dependent: :destroy
  has_many :students, through: :attendees, source: :user
  has_many :tests
end
