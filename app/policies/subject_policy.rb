class SubjectPolicy < ApplicationPolicy
  include Roles
  attr_reader :user, :subject

  def initialize(user, subject)
    @user = user
    @subject = subject
  end

  def index?
    true
  end

  def show?
    if is_admin? user
      true
    elsif is_teacher? user
      Seminar.where(subject: @subject).pluck(:teacher_id).include? user.id
    elsif is_student? user
      Attendee.where(subject: @subject).pluck(:student_id).include? user.id
    else 
      false
    end
  end

  def create?
    is_admin? user
  end
end
