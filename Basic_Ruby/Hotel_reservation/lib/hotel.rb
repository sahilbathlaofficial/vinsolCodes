require_relative 'season_price'
require_relative 'hotel_helper'
class Hotel
  include HotelHelper
  attr_reader :name, :seasonal_rates, :tax, :rate

  def initialize(hotel_params)
    @name = hotel_params[:name]
    @rate = hotel_params[:rate]
    @seasonal_rates = hotel_params[:seasonal_rates]
    @tax = hotel_params[:tax].to_f
  end
  
  def calculate_rent(enquiry_hash)
    reservation_timeline = []
    check_in = enquiry_hash[:enquiry].check_in
    check_out = enquiry_hash[:enquiry].check_out

    while check_in <= check_out
      current_date = check_in
      # set flag to check if current_date falls under an occasion
      flag = false
      if !(seasonal_rates.empty?)
        seasonal_rates.each do |occasion|
          #set start date - end-date of special occasion as per current year
          start_date = add_year_to_date(date: occasion.start_date, year: check_in.year)
          end_date = add_year_to_date(date: occasion.end_date, year: check_in.year)
          #adjust date in case end-date less than start_date
          (end_date >>= 12) if (end_date < start_date)
          #if current_date falls in the special_occasion update timeline
          if ( current_date >= start_date &&  current_date <= end_date ) 
            season_params = {occasion: occasion.name, days: 0, rate: rate, start_date: current_date, end_date: current_date}
            reservation_timeline << SeasonPrice.new(season_params) if new_occasion?(occasion.name, reservation_timeline)
            flag = true
            break
          end
        end  
      end
        season_params = {occasion: "Normal Days", days: 0, rate: rate, start_date: current_date, end_date: current_date}
        reservation_timeline << SeasonPrice.new(season_params) if (new_occasion?("Normal Days", reservation_timeline) && !flag)
        reservation_timeline[-1].days += 1 
        #update end_date as current_date changes
        reservation_timeline[-1].end_date = current_date
        check_in += 1
    end
    reservation_timeline
  end


  def calculate_total_rent(reservation_timeline)
    total_price = reservation_timeline[:reservation].inject(0) { |sum, bifurcated_timeline| sum + (bifurcated_timeline.price) }
    total_price += ( (tax/100) * total_price )
  end

end