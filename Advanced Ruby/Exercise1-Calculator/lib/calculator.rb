class Calculator
  def calculate(operand_1, operator, operand_2)
    raise "Only numbers" if(!(operand_1.is_a?Numeric) || !(operand_2.is_a?Numeric))
    operand_1.send(operator.to_sym, operand_2)
  end
end
