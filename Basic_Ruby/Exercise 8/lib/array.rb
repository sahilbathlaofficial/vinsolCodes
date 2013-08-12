class Array
  def power(raise_to)
    self.collect do |element|
      if element.is_a? Numeric
        element = element ** raise_to  
      elsif element.is_a? Array
        element.power(raise_to)
      else
        element = element.to_s + "[Power function not applicable on this type]"
      end 
    end
  end
end


