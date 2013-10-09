class Time

  def add_time(other_time)  
    new_time = self + (other_time - Time.parse("00:00:00"))
    days = (Time.now.day == new_time.day) ? 0 : 1
    return({ Days: days, Hours: new_time.hour, Mins: new_time.min, Secs: new_time.sec })
  end
  
end