#! /usr/bin/ruby
require_relative '../lib/product'
require_relative '../lib/invoice'

product_array = []

loop do

  print "Name of the product : " 
  product_name = gets.chomp
  redo unless(product_name.size != 0) 

  while true  
    print "import_duty?:" 
    import_duty = gets.chomp
    if(import_duty =~ /^(yes|no)$/i)
      import_duty = (import_duty =~ /^yes$/i) ? true : false 
      break
    end
  end

  while true
    sales_tax = "no" if product_name =~ /book|food|medicine/i
    if(sales_tax =~ /^(yes|no)$/i)
      sales_tax = (sales_tax =~ /^yes$/i) ? true : false 
      break
    end
    print "Exempted from tax? :" 
    sales_tax = gets.chomp
  end

  while true
    print "Price: "
    price = gets.to_f
    break if (price != 0)
  end

  product_array << Product.new(product_name, price, import_duty, sales_tax)
  puts "Do you want to continue?" 
  continue = gets
  break if(continue !~ /^(y|yes)$/i)

end
invoice = Invoice.new(product_array)
invoice.generate_invoice

