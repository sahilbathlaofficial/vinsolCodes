class String
  def check_valid?
   self =~ /([01]?[0-9]|2[0-3]):([0-5][0-9]|6[0]):([0-5][0-9]|6[0])/
  end
  def add_time(other_time)
    time_first = Time.parse(self) 
    time_second = Time.parse(other_time)
    new_time = time_first + (time_second - Time.parse("00:00:00"))
    days = (Time.now.day == new_time.day) ? 0 : 1
    print days," Days\n"
    printf("%02d:%02d:%02d\n", new_time.hour, new_time.min, new_time.sec)
  end
end
