require "time"
class String

  def time_valid?(time)
   time =~ /([01]?[0-9]|2[0-3]):([0-5][0-9]|6[0]):([0-5][0-9]|6[0])/
  end

  def to_time
    Time.parse(self) if time_valid?(self)
  end

end