  require 'date'

class Enquiry
  attr_reader :check_in, :check_out

  def initialize(check_in, check_out)
    begin
      @check_in = Date.parse(check_in)
      @check_out = Date.parse(check_out)
    rescue ArgumentError
      puts "Date format not proper. Exiting.." 
      abort 
    end
  end
  
end
