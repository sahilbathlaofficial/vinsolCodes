require 'csv'
require_relative 'file_name_extractor'
require_relative 'naming_convention'

class CSVParser
  include FileNameExtractor
  include NamingConvention
  attr_reader :file_name
  attr_accessor :headers, :rows

    def initialize(file_params)
      @file_name = extract_file_name(file_params[:file_path])
      extract_rows_and_headers(file_params[:file_path])
    end

    def extract_rows_and_headers(file_path)
      csv_rows = CSV.read(file_path)
      self.headers = add_naming_convention(*csv_rows[0])
      self.rows = csv_rows[1..-1] 
    end

    def make_dynamic_class
      dynamic_class = file_name.capitalize
      Object.const_set(dynamic_class, Class.new)
      dynamic_class =  Object.const_get(dynamic_class)
      #make attribute accesor for each instance variable
      dynamic_class.send(:attr_accessor, *headers) 
      #make a function to display the values in these instance variable
      dynamic_class.class_eval do 
        define_method "show_csv_data" do 
          output = ''
          instance_variables.each { |instance_variable| output += self.send(instance_variable.to_s[1..-1])  + ' ' }
          output
        end
      end
      dynamic_class
    end

    def make_dynamic_objects(dynamic_class)
      dynamic_class_objects = []
      rows.each do |instance_variables_values|
        dynamic_class_objects << dynamic_class.new
        headers.size. times do |i|
          dynamic_class_objects[-1].send("#{ headers[i] }=", instance_variables_values[i])
        end
      end
      dynamic_class_objects
    end

    def to_class_objects
      dynamic_class = make_dynamic_class
      make_dynamic_objects(dynamic_class)
    end  
end