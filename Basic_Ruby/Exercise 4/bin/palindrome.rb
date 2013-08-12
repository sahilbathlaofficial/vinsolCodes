#! /usr/bin/ruby
while true
  begin
    system("stty raw echo")
    characterInput = STDIN.getc
    break if (characterInput.to_s =~ /q/i)
    inputString = (inputString || '') << characterInput
  ensure
    system("stty -raw echo")
  end
end
print "\n#{inputString}",inputString == inputString.reverse ?  " is a Palindrome" : " is not a Palindrome"

