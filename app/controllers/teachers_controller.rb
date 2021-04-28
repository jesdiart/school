class TeachersController < ApplicationController

  def show
    @teacher = authorize Teacher.find(params[:id])
  end
  
  def home
    @teacher = authorize Teacher.find(params[:id])
  end

end
