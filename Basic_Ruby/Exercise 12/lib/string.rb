class String
  def show_different_letter_count
    lower_case_count = 0;upper_case_count = 0;digits_count = 0;special_symbols_count = 0
    self.gsub(/\s/,'').each_char do |element|
      case element
        when '1'..'9'  then digits_count += 1
        when 'a'..'z' then lower_case_count += 1
        when 'A'..'Z' then upper_case_count += 1
        else special_symbols_count += 1
      end
    end
    puts "Lower case letters = #{lower_case_count}" 
    puts "Upper case letters = #{upper_case_count}"
    puts "Digits= #{digits_count}"
    puts "Special letters = #{special_symbols_count}"
  end  
end
