class UsersController < ApplicationController

  def approve
    @user = User.find(params[:id])
    @user.update(approved: true)
    redirect_to root_path
  end

end
