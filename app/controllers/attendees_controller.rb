class AttendeesController < ApplicationController

  def show
    @subject = authorize Subject.find(params[:id])
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @students = Student.left_outer_joins(:attendees).where(attendees: {subject_id: nil}).or(Student.left_outer_joins(:attendees).where.not(attendees: {subject_id: params[:subject_id]}))
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
