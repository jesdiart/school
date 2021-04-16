class AdministratorsController < ApplicationController

  def show
    @administrator = Administrator.find(params[:id])
    @teachers = Teacher.where(approved: true)
    @pending_approvals = User.where(approved: false).sort_by{ |user| user.type }
  end

end