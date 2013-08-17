class Fixnum
  def factorial
    result = 1
    for i in 1..self
      result *= i
    end
    result
  end
end
