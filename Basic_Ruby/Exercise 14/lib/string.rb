class String
  def reverse_words
    split(/\s/).reverse.join(" ")
  end
end
