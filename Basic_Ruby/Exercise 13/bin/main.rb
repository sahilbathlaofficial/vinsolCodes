#! /usr/bin/ruby
require_relative "../lib/range"
number = 0
number = gets.to_i while (number == 0)
puts (1..number).factorial
