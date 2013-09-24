class Hotel
  attr_reader :name, :seasonal_rates, :tax, :rate

  def initialize(hotel_params)
    @name = hotel_params[:name]
    @rate = hotel_params[:rate]
    @seasonal_rates = hotel_params[:seasonal_rates]
    @tax = hotel_params[:tax].to_f
  end
  
end