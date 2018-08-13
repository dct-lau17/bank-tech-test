class Account
  attr_reader :balance

  def initialize(transaction_class: Transaction)
    @balance = 0
    @transaction_class = transaction_class
    @transaction_log = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_class.new(credit: amount, balance: @balance)
  end

end
