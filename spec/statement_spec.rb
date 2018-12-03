require 'statement'

describe Statement do
  let(:account) do
    double :account, transactions:
    ['13/01/2012 || || 50.00 || 50.00', '12/01/2012 || 100.00 || || 100.00']
  end
  let(:statement) { Statement.new(account) }

  describe '.transactions' do
    it 'should give the transactions of an account in reverse chronological order' do
      expect(statement.transactions).to eq "date || credit || debit || balance\n13/01/2012 || || 50.00 || 50.00\n12/01/2012 || 100.00 || || 100.00"
    end
  end
end
