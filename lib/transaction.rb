class Transaction
  attr_reader :credit, :debit

  def initialize(credit: nil, debit: nil)
    @credit = credit
    @debit = debit
  end
end
