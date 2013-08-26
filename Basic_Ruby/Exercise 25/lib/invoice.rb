require_relative 'print_table'

class Invoice

  attr_accessor :products, :total_price

  def initialize (products)
    @products = products
  end

  def calculate_total
    @total_price  = products.inject(0) { |sum,product| sum += product.taxed_price }
  end

  def generate_invoice
    calculate_total
    data = []
    products.each do |data_row| 
      data << [data_row.name, data_row.price.round(2), data_row.sales_tax, data_row.import_duty, data_row.taxed_price.round(2)] 
    end
    PrintTable.print_table(["Name", "Price", "Sales Tax", "Import Duty", "Taxed Price"], data, 14, "Grand Total : #{ total_price }")
  end

end
