class Vehicle
  attr_reader :name,:price
  def initialize(name,price)
    @name = name
    @price = price
  end
  def show_price()
    puts "Vehicle = #{@name}"
    puts "Price = #{@price}"
  end
  def change_price=(new_price)
    @price = new_price
  end
end

class Bike < Vehicle
  attr_reader :dealer
  def initialize (name,price,dealer)
    super(name,price)
    @dealer = dealer
  end
  def show_dealer()
    puts "Dealer is #{@dealer}"
  end
end
suzuki = Bike.new("suzuki r5",200000,"tt");
suzuki.show_price()
suzuki.change_price = 500000
suzuki.show_price()
suzuki.show_dealer()
