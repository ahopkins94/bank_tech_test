# This class holds the balance and transactions of an account
class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end
  
end
