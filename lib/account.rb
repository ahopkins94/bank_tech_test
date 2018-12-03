class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def transaction(action)
    update_balance(action)
    if action.amount < 0
      @transactions.unshift("#{action.date} || || #{-action.amount}.00 || #{@balance}.00")
    else
      @transactions.unshift("#{action.date} || #{action.amount}.00 || || #{@balance}.00")
    end
  end

  private

  def update_balance(action)
    @balance += action.amount
  end
end
