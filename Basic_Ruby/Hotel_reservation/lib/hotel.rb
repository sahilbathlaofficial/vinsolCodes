require_relative 'season_price'

class Hotel
  @@hotels_list = []
  attr_reader :name, :seasonal_rates, :tax, :rate

  def initialize(name, rate, seasonal_rates, tax=0)
    @name = name
    @rate = rate
    @seasonal_rates = seasonal_rates
    @tax = tax.to_f
  end
  
  def calculate_rent(enquiry)
    reservation_timeline = []
    check_in = enquiry.check_in
    check_out = enquiry.check_out

    while check_in <= check_out
      flag = false
      if !(seasonal_rates.empty?)
        seasonal_rates.each do |occasion|
          start_date = Date.strptime(occasion.start_date + '-' + check_in.year.to_s,"%d-%m-%Y")
          end_date = Date.strptime(occasion.end_date + '-' + check_in.year.to_s,"%d-%m-%Y")
          (end_date >>= 12) if (end_date < start_date)
          if ( check_in >= start_date &&  check_in <= end_date ) 
            reservation_timeline << SeasonPrice.new(occasion.name, 0, occasion.rate, check_in, check_in) if(reservation_timeline.empty? || reservation_timeline[-1].season_name != occasion.name)
            flag = true
            break
          end
        end  
      end
        reservation_timeline << SeasonPrice.new("Normal Days", 0, rate, check_in, check_in ) if(reservation_timeline.empty? || reservation_timeline[-1].season_name != 'Normal Days') and !flag
        reservation_timeline[-1].days += 1 
        reservation_timeline[-1].end_date = check_in
        check_in += 1
    end
    reservation_timeline
  end

end
