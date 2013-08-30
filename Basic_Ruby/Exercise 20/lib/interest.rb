class Interest
  attr_accessor :principal, :rate, :time
  def initialize
    yield self
  end

  def difference_in_interest
    compound_interest - simple_interest
  end

  private 

  def simple_interest
    principal * rate * time
  end

  def compound_interest
    principal * ((rate + 1) ** time) - principal
  end

end
