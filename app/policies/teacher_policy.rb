class TeacherPolicy < ApplicationPolicy
  include Roles
  attr_reader :user, :teacher

  def initialize(user, teacher)
    @user = user
    @teacher = teacher
  end

  def show?
    is_admin? user or (is_teacher? user and user == @teacher)
  end

  def home?
    user == @teacher
  end
end
