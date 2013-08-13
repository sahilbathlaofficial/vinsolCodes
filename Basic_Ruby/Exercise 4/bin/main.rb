#! /usr/bin/ruby
require_relative "../lib/string"
while true
  begin
    system("stty raw echo")
    character_input = STDIN.getc
    break if (character_input.to_s =~ /q/i)
    input_string = (input_string || '') << character_input
  ensure
    system("stty -raw echo")
  end
end
print "\n#{input_string}", input_string.check_palindrome ?  " is a Palindrome" : " is not a Palindrome"

