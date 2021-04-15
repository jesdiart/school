class HomeController < ApplicationController
  include Roles

  def index
    if current_user
      redirect_to home_path_for current_user
    end
  end

end
