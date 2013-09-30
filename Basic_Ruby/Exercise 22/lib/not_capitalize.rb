class NotCapitalize < StandardError

  def initialize(default_msg = "Should be capitalized")
    super(default_msg)
  end

end
