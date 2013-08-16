#! /usr/bin/ruby
require_relative '../lib/product'
require_relative '../lib/invoice'

product_array = []
loop do
  print "Name of the product : " 
  product_name = gets.chomp
  redo unless(product_name.size != 0) 
  while true  
    print "import_duty?(yes/no) :" 
    import_duty = gets.chomp
    break if (import_duty.strip =~ /^(yes|no)$/i)
  end
  while true
    sales_tax = "no" if product_name =~ /book|food|medicine/i
    break if (sales_tax.strip =~ /^(yes|no)$/i)
    print "Exempted from tax? :" 
    sales_tax = gets.chomp
  end
  while true
    print "Price: "
    price = gets.to_f
    break if (price != 0)
  end
  product_array << Product.new(product_name,import_duty,sales_tax,price)
  puts "Do you want to continue?" 
  continue = gets
  break if(continue.strip !~ /^(y|yes)$/i)
end
invoice = Invoice.new(product_array)

