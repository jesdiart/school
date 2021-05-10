class SeminarsController < ApplicationController

  def new
    @subject = Subject.find(params[:subject_id])
    teacher_ids = Seminar.where(subject: @subject).pluck(:teacher_id)
    @teachers = Teacher.where.not(id: teacher_ids).and(Teacher.where(approved: true))
    @seminar = authorize Seminar.new
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @seminar = authorize @subject.seminars.create(seminar_params)
    
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
