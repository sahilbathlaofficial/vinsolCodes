#! /usr/bin/ruby
def factorial(number) 
   number >= 1 ? number = number * factorial(number - 1) : 1
end
limit = 0
limit = gets.to_i while(limit == 0)
for i in 0..limit
  for j in 0..i
    print factorial(i)/(factorial(j)*factorial(i-j))," "
  end
  puts
end




