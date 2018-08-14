require_relative './transaction'
require_relative './printer'
class Account
  attr_reader :balance, :transaction_log
  MINIMUM_DEPOSIT = 1

  def initialize(transaction_class: Transaction, printer: Printer)
    @balance = 0
    @transaction_class = transaction_class
    @transaction_log = []
    @printer = printer
  end

  def deposit(amount)
    raise 'Sorry amount does not reach minimum requirement' if
      below_deposit_requirement?(amount)

    @balance += amount
    save(@transaction_class.new(credit: amount, balance: @balance))
  end

  def withdraw(amount)
    raise 'Cannot withdraw amount that exceeds your balance' if
      exceed_balance?(amount)
    @balance -= amount
    save(@transaction_class.new(debit: amount, balance: @balance))
  end

  def statement
    @printer.new(@transaction_log).print_statement
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
