require 'account'

describe Account do
  let(:credit) { double :credit, amount: 100, date: '12/01/2012' }
  let(:debit) { double :debit, amount: -50, date: '13/01/2012' }
  let(:account) { Account.new }

  it 'should have an initial balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'should have initially have an empty array of transcations' do
    expect(account.transactions).to eq []
  end

  it 'should update the balance of an account after a deposit' do
    account.transaction(credit)
    expect(account.balance).to eq 100
  end

  it 'should update the balance of an account after a withdrawal' do
    account.transaction(credit)
    account.transaction(debit)
    expect(account.balance).to eq 50
  end

  it 'should have a transaction of a credit' do
    account.transaction(credit)
    expect(account.transactions).to eq ['12/01/2012 || 100.00 || || 100.00']
  end
end
