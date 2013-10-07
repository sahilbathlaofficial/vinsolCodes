class ControllerDevise::RegistrationsController < Devise::RegistrationsController
  include AuthenticationErrorGenerator
  before_filter :only => :create do |filter|
    filter.generate_error("Sign Up error")
    filter.configure_permitted_parameters
  end
  layout "sign_in_sign_up"

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :confirm_password) }
    end
    
end