class SeminarsController < ApplicationController

  def show
    @subject = authorize Subject.find(params[:id])
  end

  def new
    @subject = authorize Subject.find(params[:subject_id])
    @teachers = Teacher.all
    @seminar = Seminar.new
  end

  def create
    @subject = authorize Subject.find(params[:subject_id])
    @seminar = @subject.seminars.create(seminar_params)
    
    if @seminar.save!
      redirect_to @subject
    else 
      render :new
    end 
  end

  private
    def seminar_params
      params.require(:seminar).permit(:subject_id, :teacher_id)
    end

end
