class Array
  def to_hash
    hash = Hash.new{|hash,key| hash[key] = Array.new }
    for i in 0...self.length
      element = self[i]
      if ( element.is_a? Enumerable )
        hash[element.size] << element
      else
        hash[element.to_s.size] << element
      end
    end
  hash
  end
end

