require_relative 'argument_list'

class DerivedString < String
  
  include ArgumentList

  def exclude? substring
    !include? substring
  end

  def test_a_method
    puts "Enter the method you want to run on this string object"
    method_name = gets.chomp
    if(respond_to? method_name)
      args = []
      arity = method(method_name.to_sym).arity
      args = collect_arguments(arity)
      puts instance_eval  "self.#{method_name}(*args) " 
    else
      puts "Method not defined for this object"
    end
  end

end
