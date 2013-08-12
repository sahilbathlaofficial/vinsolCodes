class Array
  def to_hash
    size = 0; 
    returned_hash = self.inject( Hash.new{|hash,key| hash[key] = Array.new}) do |hash,element|
      if ( element.is_a? Enumerable )
        size = element.size
      else
         size = element.to_s.size
      end
      if size.odd? 
        if hash["odd"][size] == nil then hash["odd"][size] = [element] else hash["odd"][size] << element end
      else
        if hash["even"][size] ==  nil then hash["even"][size] = [element] else hash["even"][size] << element end
      end
      hash
    end
    returned_hash.each_value { |value| value.delete(nil)}
    returned_hash
  end
end
print [1,2,"mold",[2,3,4,5],735,"as"].to_hash if __FILE__ == $0

