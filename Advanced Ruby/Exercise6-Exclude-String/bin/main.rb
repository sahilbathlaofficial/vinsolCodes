#! /usr/bin/ruby
require_relative "../lib/derived_string.rb"
puts "Enter a string to test DeriveString class"
input_string = gets.chomp
object_derived_string = DerivedString.new(input_string)
puts "Enter the method you want to run on this string object"
method_name = gets.chomp
puts object_derived_string.instance_eval(method_name)
