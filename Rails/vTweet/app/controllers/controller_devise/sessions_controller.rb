class ControllerDevise::SessionsController < Devise::SessionsController
  include AuthenticationErrorGenerator
  layout "sign_in_sign_up"

  before_filter :only  => [:create] do |filter|
    filter.generate_error("Invalid email and password combination")
  end

end
