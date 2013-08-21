class ShoppingList
  def add(name, quantity)
    @name = name
    @quantity = quantity
    puts "#{ quantity } - #{ name }  added"
  end
  ## block to proc
  def items(&block)
  ## proc to block but now self = caller = sl
    instance_eval(&block)
  end
end
