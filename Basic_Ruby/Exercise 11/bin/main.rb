#! /usr/bin/ruby
require_relative "../lib/integer"
limit = 0
while(limit <= 0)
  puts "Enter the number of rows for pascal triangle"
  limit = gets.to_i 
end
limit.pascal_create
