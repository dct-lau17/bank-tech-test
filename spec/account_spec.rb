require 'account'
RSpec.describe Account do
  let(:transaction) { double(:transaction) }
  let(:printer) { double(:printer, print_statement: transaction) }
  subject(:account) { described_class.new(printer) }

  describe '#deposit' do
    before do
      account.deposit(100)
    end

    it 'increases the account balance by the specified amount' do
      expect(account.balance).to eq 100
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

    it 'prints out statement from using the printer instance' do
      expect(printer).to receive(:print_statement)
      account.statement
    end
  end
end
