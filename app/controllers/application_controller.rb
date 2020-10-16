class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :date_of_birth, :geolocation_access])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :address, :date_of_birth, :geolocation_access])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:address, :date_of_birth, :geolocation_access])
  end

end
