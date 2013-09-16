require_relative 'hotel'
require_relative 'temp_reservation'
require_relative 'season'

require 'json'

class HotelList

@@hotels_list = []

  def self.get_hotel_list
    dir = File.dirname($0)
    file_contents = [], seasonal_rates = []
    File.open(dir+'/hotels.json', "r") do |file|
      begin
        file.flock(File::LOCK_SH)
        file_contents = file.read
      ensure
        file.close
      end
    end
    file_contents = JSON.parse(file_contents)
    file_contents.each do |hotel_data|
      if(hotel_data.has_key? "seasonal_rates")
        hotel_data["seasonal_rates"].each do |occasion|
          occasion.each do |occasion_name, occasion_details|
            seasonal_rates << Season.new(occasion_name, occasion_details["start"], occasion_details["end"], occasion_details["rate"])
          end
        end
      end   
      @@hotels_list << Hotel.new(hotel_data["Hotel_name"], hotel_data["rate"], seasonal_rates, hotel_data["tax"])
      seasonal_rates = []
    end
  @@hotels_list
  end

  def self.show_price_catalogue(enquiry)
    @@hotels_list.each do |hotel|
      reservation = TempReservation.new
      puts "\n### Hotel : #{hotel.name} ######################\n"
      reservation.show_reservation(enquiry, hotel)
    end
  end
end