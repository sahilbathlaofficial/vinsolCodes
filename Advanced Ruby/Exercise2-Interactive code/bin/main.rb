#! /usr/etc/ruby
require_relative "../lib/string"
puts "\nPlease Enter The Code (Enter q/Q to exit or press Enter twice to evaluate your code\n\n".colorize(31)
while (line = gets) !~ /^q$/i
  code = (code || "") + line if line.size != 1
  if line.size == 1
  	puts "Your output is :- ".colorize(33)
  	begin
  		puts " #{ eval code }" 
  	rescue Exception
  			puts "#{ $! }"
  	end
  	code = ''
  	puts "\nWant to retry? Enter (yes/y)".colorize(32)
  	break if (line = gets) !~ /^yes|y$/i
    puts "\nPlease Enter The Code (Enter q/Q to exit or press Enter twice to evaluate your code\n\n".colorize(31)
  end
end
