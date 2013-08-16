class Array
  def power(exponent)
    self.collect do |element|
      if element.is_a? Numeric
        element = element ** exponent  
      elsif element.is_a? Array
        element.power(exponent)
      else
        element = element.to_s + "[Power function not applicable on this type]"
      end 
    end
  end
end


