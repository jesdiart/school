module Roles

  def home_path_for(user)
    if user
      if user.type == 'Administrator'
        administrator_path user
      end
    else
      root_path
    end
  end

end