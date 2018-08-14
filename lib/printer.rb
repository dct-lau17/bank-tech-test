class Printer
  def initialize(transaction_log)
    @transactions = transaction_log
  end

  def print_statement
    puts header
  end

  private

  def header
    %w[date credit debit balance].join(' || ')
  end
end
