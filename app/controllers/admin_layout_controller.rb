class AdminLayoutController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email first_name last_name password password_confirmation])
  end
end