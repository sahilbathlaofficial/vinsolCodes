class Customer
  attr_reader :name,:account_id,:balance;
  @@account_id = 0;
  def initialize (name)
    @name = name
    @@account_id = @@account_id + 1;
    @balance = 1000
  end
  def deposit(amount)
    @balance = @balance + amount
    puts "Amount Deposited #{amount} by #{@name} New balance = #{@balance}"
  end
  def withdraw(amount)
    @balance = @balance - amount
    puts "Amount Withdrawn #{amount} by #{@name} New balance = #{@balance}"
  end
end


