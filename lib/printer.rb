class Printer
  def initialize(transaction_log)
    @transactions = transaction_log
  end

  def print_statement
    puts header
    puts @transactions.reverse.map { |transaction|
      format(transaction)
    }.join("\n")
  end

  private

  def header
    %w[date credit debit balance].join(' || ')
  end

  def format(transaction)
    [
      transaction.date,
      transaction.credit,
      transaction.debit,
      transaction.balance
    ].join(' || ')
  end
end
