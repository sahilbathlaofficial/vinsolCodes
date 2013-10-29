class Time

  def add_time(other_time)  
    new_time = self + (other_time - Time.parse("00:00:00"))
    days = (Time.now.day == new_time.day) ? 0 : 1
    return({ days: days, hours: new_time.hour, mins: new_time.min, secs: new_time.sec })
  end
  
end