class Teacher < User
  has_many :seminars
  has_many :subjects, through: :seminars
  has_many :students, through: :subjects

  def students_performance
    unless students.empty?
      students.sum(&:performance_subjects) / students.count
    end
  end
end

