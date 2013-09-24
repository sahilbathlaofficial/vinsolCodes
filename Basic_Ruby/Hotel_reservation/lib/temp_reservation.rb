require_relative 'billable_season'
require_relative 'temp_reservation_helper'

class TempReservation
  include TempReservationHelper
  attr_reader :reservation_timeline , :hotel, :enquiry
  attr_accessor :total_price

  def initialize(enquiry_and_hotel)
    @hotel = enquiry_and_hotel[:hotel]
    @enquiry = enquiry_and_hotel[:enquiry]
  end

  def show_reservation
    @reservation_timeline = get_billable_seasons
    calculate_total_rent
    display_reservation
  end


  def get_billable_seasons
    reservation_timeline = []
    check_in, check_out = enquiry.check_in, enquiry.check_out
    previous_date = check_in

    while check_in.year <= check_out.year
      if !(hotel.seasonal_rates.empty?)
        hotel.seasonal_rates.each do |occasion|
          #set start date 
          start_date = add_year_to_date(date: occasion.start_date, year: check_in.year)
          end_date = add_year_to_date(date: occasion.end_date, year: check_in.year)
          #adjust date in case end-date less than start_date
          (end_date >>= 12) if (end_date < start_date)
          #if current_date falls in the special_occasion update timeline
          common_dates = ((start_date..end_date) & (check_in..check_out)).to_a
          if !(common_dates.empty?)  
            if(previous_date < common_dates[0])
              season_params = {occasion: "Normal Days", days: (previous_date..(common_dates[0] - 1)).to_a.length, rate: hotel.rate, start_date: previous_date, end_date: common_dates[0] - 1 }
              reservation_timeline << BillableSeason.new(season_params) 
            end
            season_params = {occasion: occasion.name, days: common_dates.size, rate: occasion.rate, start_date: common_dates[0], end_date: common_dates[-1]}
            reservation_timeline << BillableSeason.new(season_params) 
            previous_date = common_dates[-1] + 1
          end
        end
      end  
      (check_in >>= 12)
    end
    check_in, check_out = enquiry.check_in, enquiry.check_out
    season_params = {occasion: "Normal Days", days: (previous_date..check_out).to_a.length , rate: hotel.rate, start_date: previous_date, end_date: check_out }
    reservation_timeline << BillableSeason.new(season_params) if previous_date < check_out
    reservation_timeline
  end

  def calculate_total_rent
    self.total_price = reservation_timeline.inject(0) { |sum, bifurcated_timeline| sum + (bifurcated_timeline.price) }
    self.total_price += ( (hotel.tax/100) * total_price )
  end

  def display_reservation
    reservation_timeline.each do |bifurcated_timeline|
      puts "------------------------------"
       print "Occasion- ", bifurcated_timeline.season_name, "\n"
      print "From- ", bifurcated_timeline.start_date, " To ", bifurcated_timeline.end_date, "\n" if bifurcated_timeline.start_date != ''
      print "Rate- ", bifurcated_timeline.rate, " for ", bifurcated_timeline.days, "days \n"
      print "Price of this duration- ", bifurcated_timeline.price, "\n"
      puts "------------------------------"
    end
    puts "Total: #{ total_price }"
    puts "------------------------------"
  end
  
end