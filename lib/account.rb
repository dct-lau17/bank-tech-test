require_relative './transaction'
require_relative './printer'
class Account
  attr_reader :balance
  MINIMUM_DEPOSIT = 1

  def initialize(printer = Printer.new)
    @balance = 0
    @transaction_log = []
    @printer = printer
  end

  def deposit(amount)
    raise 'Sorry amount does not reach minimum requirement' if
      below_deposit_requirement?(amount)
    @balance += amount
    save(Transaction.new(credit: "%.2f" % amount, balance: "%.2f" % @balance))
  end

  def withdraw(amount)
    raise 'Cannot withdraw amount that exceeds your balance' if
      exceed_balance?(amount)
    @balance -= amount
    save(Transaction.new(debit: "%.2f" % amount, balance: "%.2f" % @balance))
  end

  def statement
    @printer.print_statement(@transaction_log)
  end

  private

  def save(transaction)
    @transaction_log << transaction
  end

  def below_deposit_requirement?(amount)
    amount < MINIMUM_DEPOSIT
  end

  def exceed_balance?(amount)
    amount > @balance
  end
end
