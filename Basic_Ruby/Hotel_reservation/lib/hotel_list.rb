require 'rubygems'
require 'json'
require 'date'

module HotelList
  class Hotel
    attr_reader :hotel,:seasonal_rates,:tax

    def initialize(hotel,rate,seasonal_rates,tax=0)
      @hotel = hotel
      @rate = rate.to_f
      @seasonal_rates = seasonal_rates
      @tax = tax.to_f
    end

    def get_reservation(check_in,check_out)
      output = "Hotel:-" + @hotel
      begin
        check_in = Date.parse(check_in)
        check_out = Date.parse(check_out)
      rescue ArgumentError
        puts "Date format not proper. Exiting.." 
        abort 
      end
      total_price = 0
      result_of_query = get_rates(check_in,check_out)
      # Result format (Occasion=>[from,to,price,days])
      result_of_query.each do |occasion,value| 
        output += "\n##Ocassion : #{occasion}"
        output += "(from #{value[0]} to #{value[1]})" if occasion != "Normal Days"
        output += "\nRevised Rate : #{value[2]} Your stay : #{value[3]} days"
        total_price += (value[2].to_f * value[3])
      end

      output += "\n** Total Price = #{total_price}\n"      
      total_price  += total_price * (@tax/100) if (@tax != 0)
      output + "Price After Tax(#{@tax}%) = #{total_price}\n\n"
    end
    

    def get_rates(check_in,check_out)
     output = {"Normal Days" => ['','',@rate,0]}
      while check_in != check_out
        flag = false
        date = check_in
        if(@seasonal_rates.is_a?Array)
          @seasonal_rates.each do |occasions|
            occasions.each do |occasion_name,occasion|
              start_date = Date.strptime(occasion['start'] + '-' + date.year.to_s,"%d-%m-%Y")
              end_date = Date.strptime(occasion['end'] + '-' + date.year.to_s,"%d-%m-%Y")
              (end_date >>= 12) if (end_date < start_date)
              if ( date >= start_date &&  date <= end_date )
                 flag = true
                 output[occasion_name] ||=  [occasion['start'],occasion['end'],occasion["rate"],0]
                 output[occasion_name][3] += 1;
                 break
              end
            end
          end         
        end
        output["Normal Days"][3] += 1 if (!flag) 
        check_in += 1
      end
      output
    end

  end

  def self.get_hotel_list
    dir = $0.sub(/[\w\d]*.rb$/,'')
    file_contents = [],hotels = []
    File.open(dir+'hotels.json',"r") do |file|
      begin
        file.flock(File::LOCK_SH)
        file_contents = file.read
      ensure
        file.close
      end
    end
    file_contents = JSON.parse(file_contents)
    file_contents.each do |hotel_data| 
      hotels << Hotel.new(hotel_data["Hotel_name"],hotel_data["rate"],hotel_data["seasonal_rates"],hotel_data["tax"])
    end
    hotels
  end
end
