module Roles

  def home_path_for(user)
    if user
      if user.type == 'Administrator'
        administrator_path user
      elsif user.type == 'Teacher'
        teacher_path user
      elsif user.type == 'Student'
        student_path user
      else
        root_path
      end
    else
      root_path
    end
  end

end