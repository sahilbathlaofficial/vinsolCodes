require_relative "vehicle"
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
