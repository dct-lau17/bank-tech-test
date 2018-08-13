require 'account'
RSpec.describe Account do
  describe 'defaults' do
    subject(:account) { described_class.new }
    it 'has a balance of 0' do
      expect(account.balance).to eq 0
    end
  end
end
