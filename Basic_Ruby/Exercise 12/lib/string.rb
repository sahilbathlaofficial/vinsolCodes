class String
  def find_letters_in_range(range)
    split('').count { |alphabet| (range).include? alphabet } 
  end

  def show_different_letter_count
    lower_case_count = find_letters_in_range('a'..'z')
    upper_case_count = find_letters_in_range('A'..'Z')
    digits_count = find_letters_in_range('1'..'9')
    special_symbols_count = gsub(' ', '').length - lower_case_count - upper_case_count - digits_count

    puts "Lower case letters = #{ lower_case_count } "
    puts "Upper case letters = #{ upper_case_count } "
    puts "Digits = #{ digits_count }"
    puts "Special letters = #{ special_symbols_count }"
  end  
end
