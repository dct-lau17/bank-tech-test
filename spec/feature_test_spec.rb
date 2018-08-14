require 'account'

RSpec.describe Account do
  before(:each) do
    @account =  Account.new
    @account.deposit(1000)
  end

  describe '#deposit' do
    it 'can deposits an amount' do
      expect(@account.balance).to eq 1000
    end

    it 'cannot makes a deposit below the minimum amount required' do
      expect { @account.deposit(0) }.to raise_error(
        'Sorry amount does not reach minimum requirement'
      )
    end
  end

  describe '#withdraw' do
    it 'allows an a withdraw' do
      @account.withdraw(500)
      expect(@account.balance).to eq 500
    end

    it 'cannot withdraw amount over account balance' do
      expect { @account.withdraw(2000) }.to raise_error(
        'Cannot withdraw amount that exceeds your balance'
      )
    end
  end

  describe '#Statement' do
    date = Time.now.strftime('%d/%m/%Y')
    statement = "date || credit || debit || balance\n"\
                "#{date} ||  || 500.00 || 2500.00\n"\
                "#{date} || 2000.00 ||  || 3000.00\n"\
                "#{date} || 1000.00 ||  || 1000.00\n"
    it 'user sees all bank account transactions printed on the screen' do
      @account.deposit(2000)
      @account.withdraw(500)
      expect { @account.statement }.to output(statement).to_stdout
    end
  end
end
