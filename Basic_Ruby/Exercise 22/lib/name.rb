class Name
  attr_reader :first_name,:last_name
  def initialize
    begin
      @first_name = get_name
      @last_name = get_name( "last")
    end
  end
  def get_name(type = "first")
    puts "Enter #{type} name"
    name = gets.chomp
    raise Exception,"Name can't have Null values",caller[0] if (name.size == 0 )
    raise Exception,"Initial letter not capital",caller[0] if (name.strip[0] !~ /[A-Z]/)
  end
end
