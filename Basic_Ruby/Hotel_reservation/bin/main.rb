#! /usr/bin/ruby
require_relative '../lib/hotel_list'



puts "Enter check in date (yyyy-mm-dd)"
check_in = gets.chomp
puts "Enter check out date (yyyy-mm-dd)"
check_out = gets.chomp
hotels =  HotelList.get_hotel_list
puts "\n"
abort("You can't go back in time :P ") if(check_out < check_in)
hotels.each{ |hotel| puts hotel.get_reservation(check_in,check_out) } 



