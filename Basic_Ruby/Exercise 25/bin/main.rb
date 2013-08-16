#! /usr/bin/ruby
require_relative '../lib/product'
product_array = []
loop do
  print "Name of the product : " 
  product_type = gets.chomp;  redo unless(product_type.size != 0) 
  while true  
    print "Imported?(yes/no) :" 
    imported = gets.chomp
    break if (imported =~ /^yes|no$/i)
  end
  while true
    sales_tax_exemption = "no" if product_type =~ /book|food|medicine/i
    break if (sales_tax_exemption =~ /^yes|no$/i)
    print "Exempted from tax? :" 
    sales_tax_exemption = gets.chomp
  end
  while true
    print "Price: "
    price = original_price = gets.to_f
    if (price != 0)
      price += (original_price/10) if sales_tax_exemption =~ /^no$/i
      price += (original_price/20) if imported =~ /^yes$/i
      price = price.to_i
      break
    end
  end
  product_array << Product.new(product_type,price)
  puts "Do you want to continue?" 
  continue = gets
  break if(continue !~ /^y|yes$/i)
end
puts "".rjust(53,'#')
puts "|#{"Product".center(30)}|#{"Price".center(20)}|\n"
product_array.each {|element| puts element.show_product_data}
puts "".rjust(53,'#')
puts "Grand total := #{product_array.inject(0) {|sum,element| sum += element.price}}".rjust(53," ")
puts "".rjust(53,'#')
