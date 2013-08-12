#! /usr/bin/ruby
require_relative "../lib/customer"
john = Customer.new('john')
ron = Customer.new('ron')
john.deposit(200)
ron.withdraw(100)
