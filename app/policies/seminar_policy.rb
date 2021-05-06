class SeminarPolicy < ApplicationPolicy
  include Roles

  def create?
    is_admin? user
  end
end
