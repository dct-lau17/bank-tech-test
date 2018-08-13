require 'transaction'

RSpec.describe Transaction do
  context 'User deposits an amount' do
    subject(:deposit_transaction) { described_class.new(credit: 100) }
    describe '#credit' do
      it 'can record the deposit of a transaction' do
        expect(deposit_transaction.credit).to eq 100
      end

      it 'debits nil as default' do
        expect(deposit_transaction.debit).to eq nil
      end
    end
  end

  context 'User withdraws amount' do
    subject(:withdraw_transaction) { described_class.new(debit: 100) }
    describe '#credit' do
      it 'can record the deposit of a transaction' do
        expect(withdraw_transaction.debit).to eq 100
      end

      it 'credits nil as default' do
        expect(withdraw_transaction.credit).to eq nil
      end
    end
  end

  describe '#date' do
    let(:time) { double :time }
    let(:date_format) { double(:date) }
    subject(:transaction) { described_class.new(date: time) }

    it 'returns a date the transaction was made' do
      allow(time).to receive(:strftime).with('%Y-%d-%m').and_return(date_format)
      expect(transaction.date).to eq date_format
    end
  end

  describe '#balance' do
    let(:default_transaction) { described_class.new }

    it 'has a default value of nil' do
      expect(default_transaction.balance).to eq nil
    end

    subject(:transaction) { described_class.new(balance: 100) }
    it 'returns a snapshot of the balance at the point of transaction' do
      expect(transaction.balance).to eq 100
    end
  end
end
