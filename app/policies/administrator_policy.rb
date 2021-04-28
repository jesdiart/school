class AdministratorPolicy < ApplicationPolicy
  include Roles
  attr_reader :user, :administrator

  def initialize(user, administrator)
    @user = user
    @administrator = administrator
  end

  def show?
    is_admin? user
  end

  def home?
    user == @administrator
  end
end
