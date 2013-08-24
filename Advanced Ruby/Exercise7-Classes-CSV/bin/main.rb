#! /usr/bin/ruby
require 'csv'
require_relative '../lib/csv_transformer'
dynamic_class_objects = CSVTransformer.to_class_objects(ARGV[0])
dynamic_class_objects.each { |instance| puts instance.show_csv_data }

