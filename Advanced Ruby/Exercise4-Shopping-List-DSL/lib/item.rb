class Item

  attr_reader :name, :quantity

  def initialize(item)
    @name = item[:name]
    @quantity = item[:quantity]
  end

end
