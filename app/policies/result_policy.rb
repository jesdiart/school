class ResultPolicy < ApplicationPolicy
  include Roles
  attr_reader :user, :result

  def initialize(user, result)
    @user = user
    @result = result
  end

  def create?
    is_teacher? user and teaches_subject? user, @result.test.subject
  end
end
