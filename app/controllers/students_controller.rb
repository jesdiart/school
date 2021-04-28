class StudentsController < ApplicationController

  def show
    @student = authorize Student.find(params[:id])
  end

  def home
    @student = authorize Student.find(params[:id])
  end

end
