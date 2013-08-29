#! /usr/bin/ruby
require_relative "../lib/integer"
while true
  puts "Enter any number(greater than equal to 0) to find its factorial"
  number = gets.chomp
  break if number == '0' || number.to_i != 0
end
puts "Factorial is #{ number.to_i.factorial }"