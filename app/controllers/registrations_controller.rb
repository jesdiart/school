# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  include Roles
  
  after_action :admin_approved, only: [:create]

  private
    def admin_approved
      resource.update!(approved: true) if is_admin? current_user
    end

end
