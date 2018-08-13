class Account
  attr_reader :balance, :transaction_log

  def initialize(transaction_class: Transaction)
    @balance = 0
    @transaction_class = transaction_class
    @transaction_log = []
  end

  def deposit(amount)
    @balance += amount
    save(@transaction_class.new(credit: amount, balance: @balance))
  end

  private

  def save(transaction)
    @transaction_log << transaction
  end
end
