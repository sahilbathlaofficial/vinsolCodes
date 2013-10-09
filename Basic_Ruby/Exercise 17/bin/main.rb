#! /usr/bin/ruby
require_relative '../lib/time.rb'
require_relative '../lib/string.rb'

def input_time(index)
  puts "Enter #{ index } time in (hh:mm:ss) format" 
  gets
end

time_first = input_time('1st').to_time
time_second = input_time('2nd').to_time
added_time = time_first.add_time(time_second)
print "\n", added_time[:Days], ' Days & ', added_time[:Hours], ':', added_time[:Mins], ':', added_time[:Secs], "\n"