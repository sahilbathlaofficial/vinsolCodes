#! /usr/bin/ruby
require_relative '../lib/interest'

puts "Enter Principal"
principal = gets while(principal = principal.to_i) == 0
puts "Enter Time"
time = gets while(time = time.to_i) == 0

#interest = Interest.new(Principal,Time,Rate)
interest = Interest.new do |class_instance|
  class_instance.principal = principal
  class_instance.time = time
  class_instance.rate = 10/100.0
end
puts "Difference in interest- #{ interest.difference_in_interest.round(2) }"
