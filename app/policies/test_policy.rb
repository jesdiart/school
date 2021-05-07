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
      teaches_subject? user, @test.subject
    elsif is_student? user
      attends_subject? user, @test.subject
    else 
      false
    end
  end

  def create?
    is_teacher? user
  end
end
