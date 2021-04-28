class Subject < ApplicationRecord
  has_many :seminars, dependent: :destroy
  has_many :teachers, through: :seminars, source: :user
end
