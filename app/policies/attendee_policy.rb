class AttendeePolicy < ApplicationPolicy
  include Roles

  def create?
    is_teacher? user
  end
end
