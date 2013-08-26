#! /usr/bin/ruby
require_relative '../lib/hotel'
require_relative '../lib/reservation'

puts "Enter check in date (yyyy-mm-dd)"
check_in = gets.chomp
puts "Enter check out date (yyyy-mm-dd)"
check_out = gets.chomp
hotels =  Hotel.get_hotel_list
puts "\n"
abort("You can't go back in time ") if(check_out < check_in)
reservation = Reservation.new(check_in, check_out)
hotels.each{ |hotel| puts reservation.calculate_rent(hotel) } 
