class HomeController < ApplicationController
  def index
    if current_user
      if current_user.type == 'Administrator'
        redirect_to administrator_path current_user
      end
    end
  end
end
