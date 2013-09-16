class TempReservation
  attr_reader :reservation_timeline, :total_price

  def show_reservation(enquiry, hotel)
    @reservation_timeline = hotel.calculate_rent(enquiry)
    calculate_total_rent(hotel)
    display_reservation
  end

  def calculate_total_rent(hotel)
    @total_price = reservation_timeline.inject(0) { |sum, bifurcated_timeline| sum + (bifurcated_timeline.days.to_i * bifurcated_timeline.rate.to_f) }
    @total_price += ( (hotel.tax/100) * total_price )
  end

  def display_reservation
    reservation_timeline.each do |bifurcated_timeline|
      puts "------------------------------"
      print "From- ", bifurcated_timeline.start_date, " To ", bifurcated_timeline.end_date, "\n" if bifurcated_timeline.start_date != ''
      print "Rate- ", bifurcated_timeline.rate, " for ", bifurcated_timeline.days, "days \n"
      print "Occasion- ", bifurcated_timeline.season_name, "\n"
      puts "------------------------------"
    end
    puts "Total: #{ total_price }"
    puts "------------------------------"
  end
end