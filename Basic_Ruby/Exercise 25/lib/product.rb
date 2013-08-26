class Product

  SALES_TAX = 0.1
  IMPORT_DUTY = 0.05
  attr_reader :price, :taxed_price, :name, :sales_tax, :import_duty

  def initialize (product_name, price, import_duty = true, sales_tax = true)
    @name = product_name
    @sales_tax = sales_tax
    @import_duty = import_duty
    @price = price
    @taxed_price =  price_after_tax
  end

  def price_after_tax
    original_price = temp_price = price
    temp_price += (original_price * (SALES_TAX)) if sales_tax ==  false
    temp_price += (original_price * (IMPORT_DUTY)) if import_duty == true
    temp_price
  end

end

