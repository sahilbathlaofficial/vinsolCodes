require 'date'

class Reservation

  def initialize(check_in, check_out)
    @check_in = check_in
    @check_out = check_out
  end

  def calculate_rent(hotel)
    output = "Hotel:-" + hotel.name

    begin
      check_in = Date.parse(@check_in)
      check_out = Date.parse(@check_out)
    rescue ArgumentError
      puts "Date format not proper. Exiting.." 
      abort 
    end

    total_price = 0
    result_of_query = get_rates(hotel,check_in, check_out)
    # Output of the query in format (Occasion=>[from,to,price,days])
    result_of_query.each do |occasion,value| 
      output += "\n##Ocassion : #{ occasion }"
      output += "(from #{ value[0] } to #{ value[1] })" if occasion != "Normal Days"
      output += "\nRevised Rate : #{ value[2] } Your stay : #{ value[3] } days"
      total_price += (value[2].to_f * value[3])
    end
    output += "\n** Total Price = #{ total_price }\n"      
    total_price  += total_price * (hotel.tax/100) if (hotel.tax != 0)
    output + "Price After Tax(#{ hotel.tax }%) = #{ total_price }\n\n"
  end
    

  def get_rates(hotel,check_in, check_out)
    #format (Occasion=>[from,to,price,days])
    output = {"Normal Days" => ['','',hotel.rate,0]}
    while check_in != check_out
      flag = false
      date = check_in
      if(hotel.seasonal_rates.is_a? Array)
        hotel.seasonal_rates.each do |occasions|
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

