require 'account'
RSpec.describe Account do
  let(:transaction) { double(:transaction) }
  let(:transaction_class) { double(:transaction_class, new: transaction) }
  subject(:account) { described_class.new(transaction_class: transaction_class) }


  describe '#defaults' do
    it 'has a balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    before do
      account.deposit(100)
    end

    it 'increases the bank balance by the specified amount' do
      expect(account.balance).to eq 100
    end

    it 'creates a transaction instance with a credit value' do
      expect(transaction_class).to have_received(:new)
        .with(credit: 100, balance: 100)
    end
  end
end
