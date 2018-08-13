class Transaction
  attr_reader :credit

  def initialize(credit: nil)
    @credit = credit
  end
end
