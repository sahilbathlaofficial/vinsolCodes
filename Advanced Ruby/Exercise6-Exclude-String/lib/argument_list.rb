class ArgumentList
  attr_accessor :instance, :method_name, :arity, :arguments
  def initialize(params)
    @instance = params[:instance]
    @method_name = params[:method_name] 
    @arity = params[:arity]
    @arguments = []
  end

  def generate_arguments
    #if variable number of arguments
    if arity < 0
      self.arguments = fixed_arguments_list(number_of_args: arity.abs - 1) if arity != -1
      self.arguments += has_variable_arguments? ? variable_arguments_input : optional_arguments_list
    else
      #if fixed number of arguments
      self.arguments = fixed_arguments_list(number_of_args: arity) if arity > 0
    end
    arguments
  end


  def has_variable_arguments?
    instance.method(method_name.to_sym).parameters.any?{ |array| array[0] == :rest } 
  end

  ## In case of variable arguments ##
  def variable_arguments_input
    args = []
    repeat = ''
    puts "Enter Variable arguments"
    begin
      puts "Want to enter more arguments?(Yes/No)"
      repeat = gets.chomp
      break if !(repeat =~ /^yes$/i)
      args << input_argument
    end while (repeat =~ /^yes$/i)
    args
  end

  ## In case of fixed/required arguments ####
  def fixed_arguments_list(arguments_hash)
    args = []
    print "There are ", arguments_hash[:number_of_args], " Required arguments\n"
    arguments_hash[:number_of_args].times do 
      args << input_argument
    end
    args
  end
  ## In case default arguments ###
  def optional_arguments_list
    args = []
    repeat =  ''   
    optional_arg_count = instance.method(method_name.to_sym).parameters.count{ |array| array[0] == :opt }
    print "Enter ", optional_arg_count, " optional arguments\n"
    optional_arg_count.times do 
      puts "Want to enter more optional arguments?(Yes/No)"
      repeat = gets.chomp
      break if !(repeat =~ /^yes$/i)
      args << input_argument
    end
    args
  end

  def input_argument
    puts "Input next argument "
    eval gets.chomp
  end

end