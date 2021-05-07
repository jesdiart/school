class Student < User
  has_many :attendees
  has_many :subjects, through: :attendees
end
