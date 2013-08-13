class String
  def highlight(word)
    input_string = self
    count = 0;index = 0
    while index <= (input_string.size - word.size)
      range = index...index + word.size
      if input_string[range].downcase == word.downcase
        input_string[range] = "(#{input_string[range]})"
        index += (word.size + 2)
        count += 1
      else
        index += 1
      end
    end
  puts input_string
  puts "Total Occurence = ",count
  end
end
