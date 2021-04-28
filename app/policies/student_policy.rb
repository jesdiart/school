class StudentPolicy < ApplicationPolicy
  include Roles
  attr_reader :user, :administrator

  def initialize(user, student)
    @user = user
    @student = student
  end

  def show?
    is_admin? user or (is_student? user and user == @student)
  end
end
