#! /usr/bin/ruby
require_relative "../lib/bike"
suzuki = Bike.new("suzuki r5",200000,"tt");
suzuki.show_contents
suzuki.change_price = 500000
suzuki.show_contents

