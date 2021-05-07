module Roles

  def is_admin?(user)
    !user.nil? && user.type == 'Administrator'
  end

  def is_teacher?(user)
    !user.nil? && user.type == 'Teacher'
  end

  def is_student?(user)
    !user.nil? && user.type == 'Student'
  end

  def home_path_for(user)
    if user
      if is_admin? user
        home_administrator_path user
      elsif is_teacher? user
        home_teacher_path user
      elsif is_student? user
        home_student_path user
      else
        root_path
      end
    else
      root_path
    end
  end

  def teaches_subject?(teacher, subject)
    Seminar.where(subject: subject).pluck(:teacher_id).include? user.id
  end 

  def attends_subject?(student, subject)
    Attendee.where(subject: subject).pluck(:student_id).include? user.id
  end

end