require 'date'

class Enquiry
  attr_reader :check_in, :check_out

  def initialize(enquiry_params)
    begin
      @check_in = Date.parse(enquiry_params[:check_in])
      @check_out = Date.parse(enquiry_params[:check_out])
    rescue ArgumentError
      puts "Date format not proper. Exiting.." 
      abort 
    end
  end
  
end