class Transaction
  attr_reader :credit, :debit, :date, :balance

  def initialize(credit: nil, debit: nil, date: Time.now, balance: nil)
    @credit = credit
    @debit = debit
    @date = date.strftime('%d/%m/%Y')
    @balance = balance
  end
end
