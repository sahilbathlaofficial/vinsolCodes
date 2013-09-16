class TempReservation
  attr_reader :reservation_timeline, :total_price, :hotel, :enquiry

  def initialize(enquiry_and_hotel)
    @hotel = enquiry_and_hotel[:hotel]
    @enquiry = enquiry_and_hotel[:enquiry]
  end

  def show_reservation
    @reservation_timeline = hotel.calculate_rent(enquiry: enquiry)
    @total_price = hotel.calculate_total_rent(reservation: reservation_timeline)
    display_reservation
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