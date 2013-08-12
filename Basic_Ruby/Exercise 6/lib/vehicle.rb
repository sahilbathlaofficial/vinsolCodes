class Vehicle
  def initialize(name,price)
    @name = name
    @price = price
  end
  def show_contents()
    puts "\nVehicle = #{@name}"
    puts "Price = #{@price}"
  end
  def change_price=(new_price)
    @price = new_price
    puts "\nChanged price = #{@price}"
  end
end
