require_relative 'not_null'
require_relative 'not_capitalize'

class Name
  attr_reader :first_name, :last_name

  def initialize
    begin
      @first_name = get_name
      @last_name = get_name("last")
    end
  end

  def get_name(type = "first")
    puts "Enter #{ type } name"
    name = gets.chomp
    raise NotNull  if(name.empty?)
    raise NotCapitalize if(name[0] !~ /[A-Z]/)
    name
  end

end