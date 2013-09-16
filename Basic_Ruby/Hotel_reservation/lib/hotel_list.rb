require_relative 'hotel'
require_relative 'temp_reservation'
require_relative 'season'
require_relative 'json_reader'

class HotelList

include JSONReader
attr_accessor :hotels_list

  def initialize
    @hotels_list = []
  end

  def get_hotel_list
    seasonal_rates = []
    file_contents = json_to_hash('hotels.json')
    file_contents.each do |hotel_data|
      if(hotel_data.has_key? "seasonal_rates")
        hotel_data["seasonal_rates"].each do |occasion|
          occasion.each do |occasion_name, occasion_details|
            season_params = {name: occasion_name, start_date: occasion_details["start"], end_date: occasion_details["end"], rate: occasion_details["rate"]}
            seasonal_rates << Season.new(season_params)
          end
        end
      end 
      hotel_params = {name: hotel_data["Hotel_name"], rate: hotel_data["rate"], seasonal_rates: seasonal_rates, tax: hotel_data["tax"]} 
      self.hotels_list << Hotel.new(hotel_params)
      seasonal_rates = []
    end
  end

  def show_price_catalogue(enquiry_hash)
    hotels_list.each do |hotel|
      reservation = TempReservation.new(enquiry: enquiry_hash[:enquiry], hotel: hotel)
      puts "\n### Hotel : #{hotel.name} ######################\n"
      reservation.show_reservation
    end
  end

end