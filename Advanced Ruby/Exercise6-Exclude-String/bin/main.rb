#! /usr/bin/ruby
require_relative "../lib/derived_string.rb"
puts "Enter a string to test DeriveString class"
object_derived_string = DerivedString.new(gets.chomp)
object_derived_string.test_a_method