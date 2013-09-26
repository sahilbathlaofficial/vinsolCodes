module NamingConvention
  def add_naming_convention(*args)
    args.collect! do |arg|
      arg.gsub!(/\W/,'_')
      arg = ('i' + arg) if !(arg[0] =~ /[a-z]/)
      arg = arg.to_sym
    end
    args
  end
end