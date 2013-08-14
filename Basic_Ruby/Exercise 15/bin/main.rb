#! /usr/bin/ruby
require 'prime'
require_relative "../lib/integer"
limit = gets while (limit = limit.to_i) == 0
puts limit < 2 ? "No prime number" : "Prime Numbers \n2"
3.step(limit,2).each {|number| puts number if number.check_prime? } if limit > 2



