class AttendeesController < ApplicationController

  def new
    @subject = Subject.find(params[:subject_id])
    student_ids = Attendee.where(subject: @subject).pluck(:student_id)
    @students = Student.where.not(id: student_ids)
    @attendee = authorize Attendee.new
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @attendee = authorize @subject.attendees.create(attendee_params)
    
    if @attendee.save!
      redirect_to @subject
    else 
      render :new
    end 
  end

  private
    def attendee_params
      params.require(:attendee).permit(:subject_id, :student_id)
    end

end
