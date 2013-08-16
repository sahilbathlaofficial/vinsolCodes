class Product
  SALES_TAX = 10
  IMPORT_DUTY = 5
  attr_reader :price,:taxed_price,:product,:sales_tax,:import_duty
  def initialize (product_type,import_duty,sales_tax,price)
    @product = product_type
    @sales_tax = sales_tax
    @import_duty = import_duty
    @price = price
    @taxed_price =  self.tax_on(@price)
  end
  def tax_on(original_price)
    taxed_price = @price
    taxed_price += (original_price * SALES_TAX/100) if @sales_tax=~ /^no$/i
    taxed_price += (original_price * IMPORT_DUTY/100) if @import_duty =~ /^yes$/i
  end
end

