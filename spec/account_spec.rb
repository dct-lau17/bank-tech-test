require 'account'
RSpec.describe Account do
  subject(:account) { described_class.new }

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
  end
end
