class Vehicle
  attr_writer :price
  def initialize(name,price)
    @name = name
    @price = price
  end
  def show_contents()
    "\nVehicle = #{@name}\nPrice = #{@price}"
  end
end
