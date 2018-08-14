require 'printer'

RSpec.describe Printer do
  describe '#print_statement' do

    before(:each) do
      transaction1 = double(:transaction, credit: 100, debit: nil, date: '11/11/2010', balance: 100)
      transaction2 = double(:transaction, credit: nil, debit: 50, date: '12/11/2010', balance: 50)
      log = [transaction1, transaction2]
      @printer =  described_class.new(log)
    end

    it 'includes a header' do
      expect(STDOUT).to receive(:puts).with('date || credit || debit || balance')
      @printer.print_statement
    end
  end
end
