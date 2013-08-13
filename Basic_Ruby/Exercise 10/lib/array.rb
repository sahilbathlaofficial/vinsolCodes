class Array
  def to_hash
    returned_hash = self.inject( Hash.new{|hash,key| hash[key] = []} ) do |hash,element|
      size = element.to_s.size
      type = size.odd? ? "odd" : "even"
      hash[type][size] ||= [] << element
      hash
    end
    returned_hash.each_value { |value| value.delete(nil)}
  end
end
print [1,2,"mold",735,"as"].to_hash if __FILE__ == $0

