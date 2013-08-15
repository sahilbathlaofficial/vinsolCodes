#! /usr/bin/ruby
require_relative "../lib/hash"
hash = {}
File.open(ARGV[0].to_s,"r") do |file|
  begin
    file.flock(File::LOCK_SH)
    file.each_line do |line|
      line = line.split(", ") 
      (hash[line[2].chomp] ||= "") <<  line[0] + "(Emp Id:#{line[1]})\n" 
    end
  ensure
    file.close
  end
end
hash.to_file("output")
