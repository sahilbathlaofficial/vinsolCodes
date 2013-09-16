require_relative 'item'

class ShoppingList

  attr_accessor :item_list

  def initialize
    @item_list = []
  end

  def add(name, quantity)
    self.item_list << Item.new(name, quantity)
  end

  ## block to proc
  def items(&block)
  ## proc to block but now self = caller = sl
    instance_eval(&block)
  end

end
