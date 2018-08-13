class Transaction
  attr_reader :credit, :debit, :date

  def initialize(credit: nil, debit: nil, date: Time.now)
    @credit = credit
    @debit = debit
    @date = date.strftime('%Y-%d-%m')
  end
end
