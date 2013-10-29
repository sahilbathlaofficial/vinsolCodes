class NotEmpty < StandardError

  def initialize(default_msg = "Can't be empty")
    super(default_msg)
  end

end
