# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  after_action :admin_approved, only: [:create]

  private
    def admin_approved
      resource.update!(approved: true) if user_signed_in? && current_user.type == 'Administrator'
    end

end
