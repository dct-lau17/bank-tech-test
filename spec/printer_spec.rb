require 'printer'

RSpec.describe Printer do
  describe '#print_statement' do
    before(:each) do
      transaction1 = double(:transaction,
                            credit: 100,
                            debit: nil,
                            date: '11/11/2010',
                            balance: 100)
      transaction2 = double(:transaction,
                            credit: nil,
                            debit: 50,
                            date: '12/11/2010',
                            balance: 50)
      @log = [transaction1, transaction2]
      @printer =  described_class.new
    end

    it 'prints full statement in reverse order' do
      expected_header = 'date || credit || debit || balance'
      expected_output_trans1 = '11/11/2010 || 100 ||  || 100'
      expected_output_trans2 = '12/11/2010 ||  || 50 || 50'
      expected_output = [expected_output_trans2, expected_output_trans1].join("\n")
      expect(STDOUT).to receive(:puts).with(expected_output)
      expect(STDOUT).to receive(:puts).with(expected_header)
      @printer.print_statement(@log)
    end
  end
end
