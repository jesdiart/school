class SubjectPolicy < ApplicationPolicy
  include Roles

  def index?
    true
  end

  def show?
    true
  end

  def create?
    is_admin? user
  end
end
