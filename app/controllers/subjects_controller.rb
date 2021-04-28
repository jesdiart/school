class SubjectsController < ApplicationController

  def index
    @subjects = authorize Subject.all
  end

  def show
    @subject = authorize Subject.find(params[:id])
  end

  def new
    @subject = authorize Subject.new
  end

  def create
    @subject = authorize Subject.new(subject_params)
    
    if @subject.save
      redirect_to @subject
    else 
      render :new
    end 
  end

  private
    def subject_params
      params.require(:subject).permit(:name, :description)
    end

end
