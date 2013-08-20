#! /usr/bin/ruby
require_relative "../lib/object_new.rb"

puts "Enter your method name"
method_name = gets.chomp
puts "Enter single line code"
code = gets
make_method(method_name, code)
puts "Output is :- " 
begin
  puts eval method_name
rescue Exception
  abort "Try and write a working code.."
end
