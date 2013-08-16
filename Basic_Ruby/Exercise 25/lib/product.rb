class Product
  attr_reader :price
  def initialize (product_type, price)
    @product = product_type
    @price = price
  end
  def show_product_data
    "|#{@product.center(30)}|#{@price.to_s.center(20)}|" 
  end
end

