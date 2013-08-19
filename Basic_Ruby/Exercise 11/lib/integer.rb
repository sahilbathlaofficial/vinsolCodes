class Integer
  def factorial(number) 
   number >= 1 ? number = number * factorial(number - 1) : 1
  end

  def pascal_triangle
    (self+1).times do |i|
      (i+1).times do |j|
        print factorial(i)/(factorial(j)*factorial(i-j))," "
      end
    puts
    end
  end
end
