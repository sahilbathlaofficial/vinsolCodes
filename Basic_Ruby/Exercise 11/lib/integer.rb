class Integer
  def factorial(number) 
   number >= 1 ? number = number * factorial(number - 1) : 1
  end

  def pascal_triangle(limit)
    limit.times do |i|
      (i+1).times do |j|
        yield factorial(i)/(factorial(j)*factorial(i-j)) 
      end
    puts 
    end
  end

  def pascal_create
    pascal_triangle(self) { |value| print value, " " }
  end
end
