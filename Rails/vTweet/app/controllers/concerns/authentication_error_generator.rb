module AuthenticationErrorGenerator

  protected

  def generate_error(msg = "Misssing fields")
    flash[:notice] = msg
  end

end