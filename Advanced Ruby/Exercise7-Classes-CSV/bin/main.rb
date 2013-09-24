#! /usr/bin/ruby
require_relative '../lib/csv_parser'
parser = CSVParser.new(filename: 'sample.csv')
dynamic_class_objects = parser.to_class_objects
dynamic_class_objects.each { |instance| puts instance.show_csv_data }

