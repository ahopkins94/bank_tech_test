require 'transaction_controller'

describe TransactionController do
  let(:credit) { double :credit, amount: 100, date: '12/01/2012' }
  let(:debit) { double :debit, amount: -50, date: '13/01/2012' }
  let(:account) { double :account, balance: 0, transactions: [] }
  let(:transaction_controller) { TransactionController.new(account) }

  it 'should initially have an empty array of transactions' do
    expect(transaction_controller.transactions).to eq []
  end

  describe '.create' do
    before(:each) do
      transaction_controller.create(credit)
    end

    it 'should update the balance of an account after a deposit' do
      expect(transaction_controller.balance).to eq 100
    end

    it 'should update the balance of an account after a withdrawal' do
      transaction_controller.create(debit)
      expect(transaction_controller.balance).to eq 50
    end

    it 'should complete a transaction of a credit' do
      expect(transaction_controller.transactions).to eq ['12/01/2012 || 100.00 || || 100.00']
    end

    it 'should complete a transaction of a debit' do
      transaction_controller.create(debit)
      expect(transaction_controller.transactions).to eq ['13/01/2012 || || 50.00 || 50.00', '12/01/2012 || 100.00 || || 100.00']
    end

    it 'should not complete transaction of a debit if the balance would return negative' do
      2.times { transaction_controller.create(debit) }
      transaction_controller.create(debit)
      expect(transaction_controller.balance).to eq 0
    end
  end
end
