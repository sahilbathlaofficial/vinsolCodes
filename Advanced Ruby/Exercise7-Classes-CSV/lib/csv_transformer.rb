module CSVTransformer

    def self.to_class_objects(file_path)

      dynamic_class = file_path.split("/")[-1].split('.')[0].capitalize
      Object.const_set(dynamic_class, Class.new)

      first_row_read = false
      class_instance_variables = []
      dynamic_class_objects = []

      CSV.foreach(ARGV[0]) do |row|
        if !(first_row_read)
          class_instance_variables = row
          first_row_read = true
        else
          instance_variables_values = row
          no_of_elements = row.size
          dynamic_class_objects << Object.const_get(dynamic_class).new
          for i in 0...no_of_elements
            dynamic_class_objects[-1].instance_variable_set('@' + class_instance_variables[i], instance_variables_values[i])
          end
        end
      end

      Object.const_get(dynamic_class).class_eval do
        define_method "show_csv_data" do
          output = ''
          for element in class_instance_variables
            output += instance_variable_get('@' + element) + ' '
          end
          output
        end
      end
      dynamic_class_objects
    end

end
