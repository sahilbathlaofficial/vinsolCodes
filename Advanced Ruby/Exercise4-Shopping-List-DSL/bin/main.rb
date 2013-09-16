#! /usr/bin/ruby
require_relative "../lib/shopping_list.rb"

sl = ShoppingList.new
sl.items do
  add("Toothpaste",2)
  add("Computer",1)
end
p sl.item_list
