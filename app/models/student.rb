class Student < User
  has_many :attendees
  has_many :subjects, through: :attendees
  has_many :results
end
