# This class controls the creation of transactions
class TransactionController
  attr_reader :balance, :transactions

  def initialize(account)
    @balance = account.balance
    @transactions = account.transactions
  end

  def create(action)
    @balance + action.amount < 0 ? nil : update_balance(action)
    return @transactions.unshift("#{action.date} || || #{-action.amount}.00 || #{@balance}.00") if action.amount < 0

    @transactions.unshift("#{action.date} || #{action.amount}.00 || || #{@balance}.00")
  end

  private

  def update_balance(action)
    @balance += action.amount
  end
end
