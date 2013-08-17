#! /usr/bin/ruby
require "csv"
require_relative "../lib/hash"
hash = {}
CSV.foreach(ARGV[0]) do |line|
  (hash[line[2]] ||= "") <<  line[0] + "(Emp Id:#{line[1]})\n" 
end
hash.to_file("output")
