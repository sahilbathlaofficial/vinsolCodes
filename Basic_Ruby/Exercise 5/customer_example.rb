require_relative "customer_class"
john = Customer.new('john')
ron = Customer.new('ron')
john.deposit(200)
ron.withdraw(100)
