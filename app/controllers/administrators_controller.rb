class AdministratorsController < ApplicationController

  def show
    @administrator = authorize Administrator.find(params[:id])
    @subjects = Subject.all
    @teachers = Teacher.where(approved: true)
    @pending_approvals = User.where(approved: false).sort_by{ |user| user.type }
  end

end
