require 'csv'
class CSVParser
  attr_reader :file_name
  attr_accessor :headers, :rows

    def initialize(file_params)
      @file_name = file_params[:filename]
      extract_rows_and_headers
    end

    def extract_rows_and_headers
      csv_rows = CSV.read(file_name)
      self.headers = csv_rows[0]
      self.rows = csv_rows[1..-1] 
    end

    def make_dynamic_class
      dynamic_class = file_name.split("/")[-1].split('.')[0].capitalize
      Object.const_set(dynamic_class, Class.new)
      dynamic_class =  Object.const_get(dynamic_class)
      #make attribute accesor for each instance variable
      headers.each { |instance_variable| dynamic_class.class_eval { attr_accessor ('i' + instance_variable.gsub(' ','')).to_sym } }
      #make a function to display the values in these instance variable
      dynamic_class.class_eval do 
        define_method "show_csv_data" do 
          output = ''
          instance_variables.each { |instance_variable| output += (eval  instance_variable.to_s) + ' ' }
          output
        end
      end
      dynamic_class
    end

    def make_dynamic_objects(dynamic_class)
      dynamic_class_objects = []
      no_of_elements = headers.size

      rows.each do |instance_variables_values|
        dynamic_class_objects << dynamic_class.new
        for i in 0...no_of_elements
          dynamic_class_objects[-1].instance_eval "self.i#{ headers[i].gsub(' ','') } = instance_variables_values[i]"
        end
      end
      dynamic_class_objects
    end

    def to_class_objects
      dynamic_class = make_dynamic_class
      make_dynamic_objects(dynamic_class)
    end  
end