require 'credit'

describe Credit do

  let(:credit) { Credit.new(100) }

  it 'should have an amount of 100' do
    expect(credit.amount).to eq 100
  end
  
end
