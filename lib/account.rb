# This class holds the balance and transactions of an account
class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def add_transaction(action)
    update_balance(action)
    @transactions.unshift(Transaction.new(@balance, action))
  end

  private

  def update_balance(action)
    @balance += action.amount
  end

end
