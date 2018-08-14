require 'account'
RSpec.describe Account do
  let(:transaction) { double(:transaction) }
  let(:transaction_class) { double(:transaction_class, new: transaction) }
  let(:printer_class) { double(:printer_class, new: printer) }
  let(:printer) { double(:printer, print_statement: transaction) }
  subject(:account) { described_class.new(transaction_class: transaction_class, printer: printer_class) }
  describe '#defaults' do
    it 'has a balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'has an empty transaction log' do
      expect(account.transaction_log).to eq []
    end
  end

  describe '#deposit' do
    before do
      account.deposit(100)
    end

    it 'increases the account balance by the specified amount' do
      expect(account.balance).to eq 100
    end

    it 'creates a transaction instance with a credit value' do
      expect(transaction_class).to have_received(:new)
        .with(credit: 100, balance: 100)
    end

    it 'stores the deposit transaction into a transaction_log' do
      expect(account.transaction_log).to include transaction
    end

    it 'raises an error if amount is less than minimum deposit requirement' do
      expect { account.deposit(0.5) }.to raise_error(
        'Sorry amount does not reach minimum requirement'
      )
    end
  end

  describe '#withdraw' do
    before do
      account.deposit(1000)
      account.withdraw(100)
    end

    it 'decrease the account balance by the specified amount' do
      expect(account.balance).to eq 900
    end

    it 'creates a transaction instance with a credit value' do
      expect(transaction_class).to have_received(:new)
        .with(debit: 100, balance: 900)
    end

    it 'stores the withdraw transaction into a transaction_log' do
      expect(account.transaction_log[1]).to eq transaction
    end

    it 'raises an error if amount is over balance of the account' do
      expect { account.withdraw(1000) }.to raise_error(
        'Cannot withdraw amount that exceeds your balance'
      )
    end
  end

  describe '#statement' do
    before do
      account.deposit(1000)
      account.withdraw(500)
    end

    it 'creates an new printer instance' do
      account.statement
      expect(printer_class).to have_received(:new)
    end

    it 'prints out statement from using the printer instance' do
      account.statement
      expect(printer).to have_received(:print_statement)
    end
  end
end
