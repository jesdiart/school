class TeachersController < ApplicationController

  def show
    @teacher = authorize Teacher.find(params[:id])
  end

end
