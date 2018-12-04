require 'statement'

describe Statement do
  let(:transaction_controller) { double :transaction_controller, transactions: ['13/01/2012 || || 50.00 || 50.00', '12/01/2012 || 100.00 || || 100.00']}
  let(:statement) { Statement.new(transaction_controller) }

  describe '.transactions' do
    it 'should give the transactions of an account in reverse chronological order' do
      expect(statement.transactions).to eq "date || credit || debit || balance\n13/01/2012 || || 50.00 || 50.00\n12/01/2012 || 100.00 || || 100.00"
    end
  end
end
