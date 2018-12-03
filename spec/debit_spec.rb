require 'debit'

describe Debit do

  let(:debit) { Debit.new(50) }

  it 'should have an amount of 50' do
    expect(debit.amount).to eq -50
  end

end
