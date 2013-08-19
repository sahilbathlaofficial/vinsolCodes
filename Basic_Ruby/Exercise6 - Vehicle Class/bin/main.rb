#! /usr/bin/ruby
require_relative "../lib/bike"
suzuki = Bike.new("suzuki r5", 200000, "tt");
puts suzuki.to_s
suzuki.price = 500000
puts suzuki.to_s
