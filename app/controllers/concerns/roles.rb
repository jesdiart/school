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
        administrator_path user
      elsif is_teacher? user
        teacher_path user
      elsif is_student? user
        student_path user
      else
        root_path
      end
    else
      root_path
    end
  end

end