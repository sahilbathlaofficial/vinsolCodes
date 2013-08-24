require_relative 'not_numeric'
class Calculator
  def self.calculate(operand_1, operator, operand_2)
    raise NotNumeric if !((operand_1.is_a? Numeric) && (operand_2.is_a? Numeric))
    operand_1.send(operator, operand_2)
  end
end
