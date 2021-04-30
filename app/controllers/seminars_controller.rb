class SeminarsController < ApplicationController

  def show
    @subject = authorize Subject.find(params[:id])
  end

  def new
    @subject = authorize Subject.find(params[:subject_id])
    @teachers = Teacher.left_outer_joins(:seminars).where(seminars: {subject_id: nil}).or(Teacher.left_outer_joins(:seminars).where.not(seminars: {subject_id: params[:subject_id]}))
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
