class String
  def colorize(color_code)
  "\e[#{ color_code }m #{ self }\e[0m"
end
end

