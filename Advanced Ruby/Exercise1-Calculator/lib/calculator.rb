class Calculator
  def self.calculate(operand_1, operator, operand_2)
    raise StandardError, "Only numbers" if !((operand_1.is_a? Numeric) && (operand_2.is_a? Numeric))
    operand_1.send(operator, operand_2)
  end
end
