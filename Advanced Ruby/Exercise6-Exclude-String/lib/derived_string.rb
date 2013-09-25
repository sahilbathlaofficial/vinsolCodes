require_relative 'argument_list'

class DerivedString < String

  def caesar_encrypt(number, args="encoded")
    each_byte{ |ch|  print ch + number.to_i }
    # do something with args
  end

  def exclude? substring
    !include? substring
  end

  def test_a_method
    puts "Enter the method you want to run on this string object\n"
    method_name = gets.chomp
    if(respond_to? method_name)
      puts "\nEnter value in proper format i.e. (String in quotes)\n\n"
      arity = method(method_name.to_sym).arity
      argument_list = ArgumentList.new(method_name: method_name, instance: self, arity: arity)
      args = argument_list.generate_arguments
      puts instance_eval  "self.#{method_name}(*args) " 
    else
      puts "Method not defined for this object"
    end
  end

end
