#! /usr/bin/ruby
require_relative "../lib/string_regex"
puts "Enter string" 
input_string = gets.chomp
puts "Enter search string" 
search_string = gets.chomp
input_string.highlight(search_string)






