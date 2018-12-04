require 'transaction'

describe Transaction do
  let(:credit) { double :credit, amount: 100, date: '12/01/2012' }
  let(:transaction) { Transaction.new(100, credit) }

  it 'should initialize with an amount' do
    expect(transaction.amount).to eq 100
  end

  it 'should initialize with a date' do
    expect(transaction.date).to eq '12/01/2012'
  end

  it 'should initialize with a balance' do
    expect(transaction.balance).to eq 100
  end

end
