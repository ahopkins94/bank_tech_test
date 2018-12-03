require 'debit'

describe Debit do

  let(:date) { '12/01/2012' }
  let(:debit) { Debit.new(50, date) }

  it 'should have an amount of 50' do
    expect(debit.amount).to eq -50
  end

  it 'should have a current date' do
    expect(debit.date).to eq '12/01/2012'
  end

end
