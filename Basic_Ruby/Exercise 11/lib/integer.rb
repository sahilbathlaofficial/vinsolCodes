class Integer
  def factorial(number) 
   number >= 1 ? number = number * factorial(number - 1) : 1
  end

  def pascal_triangle
    for i in 0..self
      for j in 0..i
        print factorial(i)/(factorial(j)*factorial(i-j))," "
      end
    puts
    end
  end
end
