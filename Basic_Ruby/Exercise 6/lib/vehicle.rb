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
