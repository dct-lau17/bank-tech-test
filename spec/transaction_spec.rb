require 'transaction'

RSpec.describe Transaction do
  context 'User deposits an amount' do
    subject(:deposit_transaction) { described_class.new(credit: 100) }
    describe '#credit' do
      it 'can record the deposit of a transaction' do
        expect(deposit_transaction.credit).to eq 100
      end
    end
  end
end
