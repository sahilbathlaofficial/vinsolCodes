#! /usr/bin/ruby
require 'prime'
require_relative '../lib/interest'

puts "Enter Principal"
principal = gets while(principal = principal.to_i) == 0
puts "Enter Time"
time = gets while(time = time.to_i) == 0

#interest = Interest.new(Principal,Time,Rate)
interest = Interest.new(principal, time, 10) do 
  @principal = principal
  @time = time
  @rate = 10
end
puts "Difference in interest- #{ interest.difference_in_interest.round(2) }"
