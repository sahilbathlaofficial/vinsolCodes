require_relative 'colorize'
class InteractiveCode

  include Colorize

  def initialize 
    reset
  end

  def reset
    @code = ''
  end 

# Benchmarkable results in switch case takes more time than if else  in real time
  def generate_code(terminating_str, evaluating_str = "END", shell_symbol = ">" )
    loop do
      print string_color(" #{ shell_symbol } ", 31)
      line = gets 
      @code += line
      abort if line.chomp =~ /^#{ Regexp.escape(terminating_str) }$/i
      break if line =~ /^#{ Regexp.escape(evaluating_str) }$/i
    end
  end

  def evaluate
    begin
      eval @code 
    rescue Exception => error
      error
    end
  end    

end
