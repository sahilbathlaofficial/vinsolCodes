#! /usr/bin/ruby
require_relative "../lib/fixnum"
require_relative "../lib/string_not_allowed"
require_relative "../lib/non_negative"
begin
  puts "Enter the number to find its factorial"
  number = gets.chomp
  raise StringNotAllowed if(!(number.eql? "0") && (number.to_i) == 0)
  number = number.to_i
  raise NonNegative if number < 0
rescue StandardError
  puts "#{ $! } Exiting Program ... "
  abort
end
print "Factorial is: ", number > 1 ? (number).factorial : "1", "\n"
