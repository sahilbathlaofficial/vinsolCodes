class String
  def check_valid?
   self =~ /([01]?[0-9]|2[0-3]):([0-5][0-9]|6[0]):([0-5][0-9]|6[0])/
  end
  def add_time(other_time_array)
    new_time = Time.parse(self) 
    other_time_array.each { |time| new_time+= (Time.parse(time) - Time.parse("00:00:00")) }
    days = (new_time.day - Time.now.day) 
    print days," Days\n"
    printf("%02d:%02d:%02d\n", new_time.hour, new_time.min, new_time.sec)
  end
end
