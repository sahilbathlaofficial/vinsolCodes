class Array
  def to_hash
    hash = Hash.new{|hash,key| hash[key] = [] }
    for element in self do
      size = (element.is_a?Enumerable) ? element.size : element.to_s.size
      hash[size] << element
    end
  hash
  end
end


