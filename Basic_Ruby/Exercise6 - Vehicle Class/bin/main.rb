#! /usr/bin/ruby
require_relative "../lib/bike"
suzuki = Bike.new("suzuki r5",200000,"tt");
puts suzuki.show_contents
suzuki.price = 500000
puts suzuki.show_contents
