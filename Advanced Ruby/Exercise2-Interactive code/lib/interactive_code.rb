require_relative 'colorize'
require 'benchmark'
class InteractiveCode

  include Colorize

  def initialize 
    reset
  end

  def reset
    @code = ''
  end 

# Benchmarkable results in switch case takes more time than if else  in real time
# code :-
# puts 2
# puts 3
# Real time in switch case :- 11.934065
# Real time in if else :- 5.434597

  def generate_code(terminating_str, evaluating_str = "END", shell_symbol = ">" )
    Benchmark.bm do |x|
      x.report do
    loop do
      print string_color(" #{ shell_symbol } ", 31)
      line = gets 
      @code += line
      abort if line.chomp =~ /^#{ Regexp.escape(terminating_str) }$/i
      break if line =~ /^#{ Regexp.escape(evaluating_str) }$/i
    end
  end
end
  end

  def evaluate
    begin
      eval @code 
    rescue Exception => code_error
      code_error
    end
  end    

end
