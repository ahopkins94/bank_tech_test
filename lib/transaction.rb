# This class controls the creation of transactions
class Transaction
  attr_reader :amount, :date, :balance

  def initialize(balance, action)
    @amount = action.amount
    @date = action.date
    @balance = balance
  end

end
