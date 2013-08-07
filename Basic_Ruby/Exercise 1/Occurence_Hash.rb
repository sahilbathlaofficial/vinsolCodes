hashAlphabets = Hash.new(0)
inputString = gets
i = 0
while i < inputString.length - 1
  if inputString[i] =~ /[a-zA-Z]/
  hashAlphabets[inputString[i]] += 1
  end
i += 1
end
i = 0
while i < hashAlphabets.keys.size
  puts "#{hashAlphabets.keys[i]}-#{hashAlphabets[inputString[i]]}"
i += 1
end

