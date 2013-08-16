#! /usr/bin/ruby
require_relative "../lib/string"
loop do
  puts "\nEnter the string to check if it is a palindrome?(Q/q) to exit"
  input_string = gets.chomp
  break if input_string =~ /^q$/i
  print "#{input_string}", input_string.check_palindrome? ?  " is a Palindrome" : " is not a Palindrome"
end
