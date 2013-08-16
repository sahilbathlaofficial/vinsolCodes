class Print
  def self.show_option(value, table_width)
    puts "".rjust(table_width,'#')
    print "Grand Total : #{value.to_s}".center(table_width)
    puts "".rjust(table_width,'#')
  end
  # options = ["string bottom","string above"]
  def self.print_table(heading, data, length=20, *options)
    table_width = (length+2) * data[0].size
    # show header
    show_option(options[1], table_width) if options[1]
    #show table body
    puts "".rjust(table_width,'#')
    heading.each {|title| print "|",title.center(length) }
    puts
    data.each {|data_row| data_row.each {|value| print "|",value.to_s.center(length) }; puts }
    #show footer
    show_option(options[0], table_width) if options[0]
  end
end
