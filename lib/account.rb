class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def transaction(action)
    @balance + action.amount < 0 ? nil : update_balance(action)
    return @transactions.unshift("#{action.date} || || #{-action.amount}.00 || #{@balance}.00") if action.amount < 0
    return @transactions.unshift("#{action.date} || #{action.amount}.00 || || #{@balance}.00")
  end

  private

  def update_balance(action)
    @balance += action.amount
  end

end
