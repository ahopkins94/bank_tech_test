require 'account'

describe Account do
  let(:debit) { double :debit, amount: -50, date: '13/01/2012'}
  let(:credit) { double :credit, amount: 100, date: '12/01/2012'}
  let(:account) { Account.new }

  it 'should inititally have a balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'should initially have an empty array of transactions' do
    expect(account.transactions).to eq []
  end

  describe '.add_transaction' do
    before(:each) do
      account.add_transaction(credit)
    end

    it 'should update the balance of an account after a deposit' do
      expect(account.balance).to eq 100
    end

    it 'should update the balance of an account after a withdrawal' do
      account.add_transaction(debit)
      expect(account.balance).to eq 50
    end

    it 'should add a transaction to an account' do
      expect(account.transactions[0]).to be_instance_of(Transaction)
    end

  end
end
