require 'rubygems'
require 'json'

class Hotel
  @@hotels_list = []
  attr_reader :name, :seasonal_rates, :tax, :rate

  def initialize(name, rate, seasonal_rates, tax=0)
    @name = name
    @rate = rate.to_f
    @seasonal_rates = seasonal_rates
    @tax = tax.to_f
  end

#Class functions 

  def self.get_hotel_list
    dir = File.dirname($0)
    file_contents = [],hotels = []
    File.open(dir+'/hotels.json',"r") do |file|
      begin
        file.flock(File::LOCK_SH)
        file_contents = file.read
      ensure
        file.close
      end
    end
    file_contents = JSON.parse(file_contents)
    file_contents.each do |hotel_data|
      @@hotels_list << Hotel.new(hotel_data["Hotel_name"], hotel_data["rate"], hotel_data["seasonal_rates"], hotel_data["tax"])
    end
  @@hotels_list
  end

end

