inputString = ''
characterInput = ''
while characterInput != 'q'
  begin
    system("stty raw echo")
    characterInput = STDIN.getc
    inputString << characterInput if characterInput =~ /qQ/
  ensure
    system("stty -raw echo")
  end
end

if inputString == inputString.reverse 
  puts "\nPalindrome"
else
  puts "\nNot a Palindrome"
end
