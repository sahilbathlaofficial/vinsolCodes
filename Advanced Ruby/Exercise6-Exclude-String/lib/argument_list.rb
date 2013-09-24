module ArgumentList

  def collect_arguments(arity)
    args = []
    #if variable number of arguments
    if arity == -1
      i = 0
      repeat = ''
      begin
        args << input_argument(i)
        i += 1
        puts "Want more arguments?(Yes/No)"
        repeat = gets.chomp
      end while (repeat =~ /^yes$/i)
    else
      #if fixed number of arguments
      arity.times do |i|
        args << input_argument(i)
      end
    end
    args
  end

  def input_argument(i)
    puts "Input argument #{ i + 1 }"
    gets.chomp
  end

end