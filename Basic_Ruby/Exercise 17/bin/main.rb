#! /usr/bin/ruby
require "time"
require_relative "../lib/string.rb"
puts "Enter 1st time in (hh:mm:ss) format" 
time_first = gets.chomp
abort("Bad format") if !time_first.check_valid?
puts "Enter 2nd time in (hh:mm:ss) format" 
time_second = gets.chomp
abort("Bad format") if !time_second.check_valid?
time_first.add_time(time_second)






