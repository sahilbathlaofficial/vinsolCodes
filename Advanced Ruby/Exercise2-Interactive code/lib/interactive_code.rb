require_relative 'colorize'
class InteractiveCode

  include Colorize

  def initialize 
    reset
  end

  def reset
    @code = ''
  end 

  def generate_code(terminating_str, evaluating_str = "\n", shell_symbol = "#" )
    loop do
      print string_color(" #{ shell_symbol } ", 31)
      line = gets 
      @code += line
      abort if @code.chomp =~ /^#{ terminating_str }$/i
      break if line == evaluating_str 
    end
  end

  def evaluate
    begin
      eval @code 
    rescue Exception => code_execution_error
      code_execution_error
    end
  end    

end
