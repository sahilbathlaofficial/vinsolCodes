#! /usr/bin/ruby
require "time"
require_relative "../lib/string.rb"

while (limit = limit.to_i) == 0
  puts "Enter number of times you wish to add"
  limit = gets 
end
time = []
(limit.to_i).times do
  puts "Enter time in (hh:mm:ss) format" 
  time << gets.chomp
  abort("Bad format") if !time[-1].check_valid?
end
time[0].add_time(time[1 .. -1])






