class Subject < ApplicationRecord
  has_many :seminars, dependent: :destroy
end
