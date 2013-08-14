class String
  def highlight(word)
    matched_elements = scan(/#{Regexp.escape(word)}/i).size
    puts gsub(/(?<word>#{Regexp.escape(word)})/i,'(\k<word>)')
    puts "Total Occurence = ",matched_elements
  end
end
