class PrintTable

  class << self

    #function to display header or footer text for the table if any 
    def header_footer(value, table_width)
      puts
      puts "".rjust(table_width, '#')
      puts "#{ value.to_s }".center(table_width)
      puts "".rjust(table_width, '#')
      puts
    end

    # options = ["Footer Text","Header Text"]
    def print_table(heading, data, length = 20, *options)
      table_width = (length + 2) * data[0].size
      # show header
      header_footer(options[1], table_width) if options[1]
      #show table body
      puts "".rjust(table_width, '#')
      heading.each {|title| print "|", "\e[31m", title.center(length), "\e[0m" }
      puts
      data.each do |data_row|
        data_row.each { |value| print "|",value.to_s.center(length) }
        puts 
      end
      puts "".rjust(table_width, '#')
      #show footer
      header_footer(options[0], table_width) if options[0]
    end

  end
end
