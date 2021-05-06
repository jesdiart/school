class TestPolicy < ApplicationPolicy
  include Roles
  attr_reader :user, :test

  def initialize(user, test)
    @user = user
    @test = test
  end

  def show?
    if is_admin? user
      true
    elsif is_teacher? user
      Seminar.where(subject: @test.subject).pluck(:teacher_id).include? user.id
    elsif is_student? user
      Attendee.where(subject: @test.subject).pluck(:student_id).include? user.id
    else 
      false
    end
  end

  def create?
    is_teacher? user
  end
end
