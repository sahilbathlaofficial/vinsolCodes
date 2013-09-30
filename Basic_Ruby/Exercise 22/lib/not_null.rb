class NotNull < StandardError

  def initialize(default_msg = "Can't be null")
    super(default_msg)
  end

end
