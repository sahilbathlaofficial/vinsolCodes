#! /usr/bin/ruby
require_relative "../lib/range"
begin
  number = gets.chomp
  raise "Error Converting it to a number" if  (!(number.eql?"0") && (number.to_i) == 0)
  number = number.to_i
  raise "Negative numbers not allowed" if number < 0
end
print "Factorial is: ", number > 1 ?  (1..number).factorial : "1","\n"




