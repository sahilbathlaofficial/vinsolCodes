inputString = ''
characterInput = ''
while (characterInput != 'q' &&  characterInput != 'Q')
  begin
    system("stty raw echo")
    characterInput = STDIN.getc
    inputString << characterInput if (characterInput != 'q' &&  characterInput != 'Q')
  ensure
    system("stty -raw echo")
  end
end
if inputString == inputString.reverse 
  puts "\n#{inputString} is a Palindrome"
else
  puts "\nNot a Palindrome"
end
