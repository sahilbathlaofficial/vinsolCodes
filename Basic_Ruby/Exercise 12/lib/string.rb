class String
  def show_different_letter_count
    letter_count = Hash.new(0)
    range_digits = '0'..'9'
    range_lower = 'a'..'z'
    range_upper = 'A'..'Z'
    white_space = ' '
    self.each_char do |element|
      case element
      when range_digits then letter_count['digits_count'] += 1
      when range_lower then letter_count['lower_case_count'] += 1
      when range_upper then letter_count['upper_case_count'] += 1
      when white_space
      else letter_count['special_symbols_count'] += 1
      end
    end
    letter_count
  end  
end
