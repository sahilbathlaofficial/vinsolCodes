require_relative 'print.rb'
class Invoice
  attr_reader :products,:total_price
  def initialize (products)
    @products = products
    @total_price = sum_price.to_i
  end
  def sum_price
    @products.inject(0) { |sum,product| sum += product.taxed_price }
  end
  def generate_invoice
    data = []
    @products.each do |data_row| 
      data << [data_row.product,data_row.price.round(2),data_row.sales_tax,data_row.import_duty,data_row.taxed_price.round(2)] 
    end
    Print.print_table(["Name","Price","Sales Tax","Import Duty","Taxed Price"],data,14,@total_price)
  end
end
