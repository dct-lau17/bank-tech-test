class Account
  attr_reader :balance, :transaction_log
  MINIMUM_DEPOSIT = 1

  def initialize(transaction_class: Transaction)
    @balance = 0
    @transaction_class = transaction_class
    @transaction_log = []
  end

  def deposit(amount)
    raise 'Sorry amount does not reach minimum requirement' if
      below_deposit_requirement?(amount)
    @balance += amount
    save(@transaction_class.new(credit: amount, balance: @balance))
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_class.new(debit: amount, balance: @balance)
  end

  private

  def save(transaction)
    @transaction_log << transaction
  end

  def below_deposit_requirement?(amount)
    amount < MINIMUM_DEPOSIT
  end
end
