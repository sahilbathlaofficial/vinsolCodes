module Colorize
  def string_color(string, color_code)
    "\e[#{ color_code }m #{ string }\e[0m"
  end
end
