class Interest

  def initialize (principal, time, rate = 10, &initialize_block)
    instance_eval &initialize_block
  end

  def difference_in_interest
    compound_interest - simple_interest
  end

  private 

  def simple_interest
    @principal * (@rate/100.0) * @time
  end

  def compound_interest
    @principal * (((@rate/100.0) + 1) ** @time) - @principal
  end

end
