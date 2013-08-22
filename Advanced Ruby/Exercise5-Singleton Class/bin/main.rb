#! /usr/bin/ruby

cat = "Cat"
dog = "Dog"
def cat.say
  puts "Meow"
end

dog.instance_eval do
  class << self
    def say
      puts "Ruff"
    end
  end
end

cat.say
dog.say
