hashAlphabets = Hash.new(0)
inputString = gets
inputString.each_char { |alphabet| hashAlphabets[alphabet] += 1 if alphabet =~ /[a-zA-Z]/ }
hashAlphabets.each { |key,value| puts "#{key} - #{value}"}

