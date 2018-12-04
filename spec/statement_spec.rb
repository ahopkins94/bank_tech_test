require 'statement'

describe Statement do
  let(:transaction1) { double :transaction, amount: 100, date: '12/01/2012', balance: 100 }
  let(:transaction2) { double :transaction, amount: -50, date: '13/01/2012', balance: 50 }
  let(:account) { double :account, transactions: [transaction2, transaction1]}
  let(:statement) { Statement.new(account) }

  describe '.transactions' do
    it 'should give the transactions of an account in reverse chronological order' do
      expect(statement.transactions).to eq "date || credit || debit || balance\n13/01/2012 || || 50.00 || 50.00\n12/01/2012 || 100.00 || || 100.00"
    end
  end
end
