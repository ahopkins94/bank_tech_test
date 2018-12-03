require 'account'

describe Account do

  let(:credit) { double :credit, amount: 100 }
  let(:account) { Account.new }

  it 'should have an initial balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'should update the balance of an account after a deposit' do
    account.update_balance(credit)
    expect(account.balance).to eq 100
  end

end
