class Array
  def to_hash
    hash = {}
    for element in self do 
      if ( element.is_a? Enumerable )
        hash[element.size] ||= [] << element
      else
        hash[element.to_s.size] ||= [] << element
      end
    end
  hash
  end
end

