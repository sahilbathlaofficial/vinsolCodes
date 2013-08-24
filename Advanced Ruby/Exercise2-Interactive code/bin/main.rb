#! /usr/bin/ruby
require_relative "../lib/interactive_code"
require_relative "../lib/colorize"

extend Colorize
code = InteractiveCode.new

terminating_string = "q"
evaluating_string = "\n"
shell_symbol = "#"

loop do
  print string_color("\nPlease Enter The Code (Enter q/Q to exit or press Enter twice to evaluate your code\n\n", 31)
  code.generate_code(terminating_string, evaluating_string, shell_symbol)
  puts string_color("Code Execution :- ", 33)
  puts code.evaluate
  code.reset
end
