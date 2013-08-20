#! /usr/bin/ruby
require_relative "../lib/range"
while true
  puts "Enter any number(greater then 0) to find its factorial"
  break if (number = gets.to_i) >= 1
end
print "Facorial is ",(1..number).factorial,"\n"
