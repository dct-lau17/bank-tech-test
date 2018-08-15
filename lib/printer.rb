class Printer
  def print_statement(transactions)
    puts header
    puts transactions.reverse.map { |transaction|
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
