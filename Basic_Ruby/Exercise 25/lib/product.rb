class Product
  def initialize (product_type, price)
    @product = product_type
    @price = price
  end
  def show_product_data
    "#{@product}'s price is : #{@price} "  
  end
end
