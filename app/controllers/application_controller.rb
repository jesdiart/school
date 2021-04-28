class ApplicationController < ActionController::Base
  include Pundit
  include Roles

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :approved])
  end

  def after_sign_in_path_for(user)
    home_path_for user
  end


end
