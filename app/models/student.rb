class Student < User
  has_many :attendees
  has_many :subjects, through: :attendees
  has_many :results

  def performance_subject(subject)
    subject_results = results.where(test: subject.tests)
    performance_tests subject_results
  end

  def performance_subjects
    performance_tests results
  end
  
  def performance_tests(test_results)
    unless test_results.empty?
      test_results.sum(&:mark) / test_results.count
    end
  end

end
