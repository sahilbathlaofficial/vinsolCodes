require_relative 'not_null'
require_relative 'not_capitalize'

class Name
  attr_reader :first_name,:last_name

  def initialize
    begin
      @first_name = get_name
      @last_name = get_name("last")
    end
  end

  def get_name(type = "first")
    puts "Enter #{ type } name"
    name = gets.chomp
    raise NotNull, "Name can't have Null values", "" if(name.size == 0 )
    raise NotCapitalize, "Initial letter not capital", "" if(name.strip[0] !~ /[A-Z]/)
  end

end
