require_relative 'negative_number'
class Integer
  def factorial
    raise NegativeNumber if self < 0
    self > 0 ? (1..self).inject(:*) : 1
  end
end
