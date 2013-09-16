#! /usr/bin/ruby
require_relative '../lib/hotel_list'
require_relative '../lib/enquiry'

puts "Enter check in date (yyyy-mm-dd)"
check_in = gets.chomp
puts "Enter check out date (yyyy-mm-dd)"
check_out = gets.chomp
hotels =  HotelList.get_hotel_list
puts "\n"
abort("You can't go back in time ") if(check_out < check_in)
enquiry = Enquiry.new(check_in, check_out)
HotelList.show_price_catalogue(enquiry)
