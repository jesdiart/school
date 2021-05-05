class AttendeePolicy < ApplicationPolicy
  include Roles

  def index?
    true
  end

  def show?
    true
  end

  def create?
    is_teacher? user
  end
end
