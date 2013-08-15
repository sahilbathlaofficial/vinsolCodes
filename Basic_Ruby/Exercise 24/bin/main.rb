#! /usr/bin/ruby
require_relative '../lib/array'
[1,"sahil",3,4,[2,3,4,4],{'2'=>3,'a'=>7}].reverse_iterate { |i| print "#{i} "}
