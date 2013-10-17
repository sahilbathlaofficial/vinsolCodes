require_relative 'not_null'
require_relative 'not_capitalize'

class Name

  def self.my_attr_writer(*variables)
    variables.each do |variable|
      define_method("#{ variable.to_s }=") do |attribute_value|
        instance_variable_set('@' + variable.to_s, attribute_value) if attribute_in_proper_format?(attribute_value) 
      end
    end
  end

  attr_reader :firstname, :lastname
  my_attr_writer :firstname, :lastname 

  def initialize(name)
    begin
      self.firstname = name[:firstname]
      self.lastname = name[:lastname]
    end
  end

  def attribute_in_proper_format?(attribute_value)
    raise NotNull  if(attribute_value.empty?)
    raise NotCapitalize if(attribute_value[0] !~ /[A-Z]/)
    true
  end

end 
