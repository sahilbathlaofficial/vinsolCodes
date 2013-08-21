#! /usr/bin/ruby
require_relative "../lib/integer"
while true
  puts "Enter any number(greater than equal to 0) to find its factorial"
  number = gets.chomp
  break if (number.to_i) >= 1 || number == '0'
end
number = number.to_i
print "Factorial is ", number > 0 ? number.factorial : "1", "\n"
