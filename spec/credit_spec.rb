require 'credit'

describe Credit do

  let(:date) { '12/01/2012' }
  let(:credit) { Credit.new(100, date) }

  it 'should have an amount of 100' do
    expect(credit.amount).to eq 100
  end

  it 'should have a current date' do
    expect(credit.date).to eq '12/01/2012'
  end

end
