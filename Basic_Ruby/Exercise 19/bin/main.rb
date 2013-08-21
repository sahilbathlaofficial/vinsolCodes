#! /usr/bin/ruby
require "time"
def check_valid? (time_args)
   time_args.each { |element| return false if element !~ /([01]?[0-9]|2[0-3]):([0-5][0-9]|6[0]):([0-5][0-9]|6[0])/ }
end
def add_time(*time_args)
  abort ("Wrong time format") if !(check_valid?(time_args))
  new_time = Time.parse("00:00:00") 
  time_args.each { |time| new_time += (Time.parse(time) - Time.parse("00:00:00")) }
  days = ((new_time - Time.now)/(24*60*60)).to_i
  print days," Days & "
  printf("%02d:%02d:%02d\n", new_time.hour, new_time.min, new_time.sec)
end

add_time("10:00:00","23:20:13","12:11:08","23:00:00")






