 class Account

   attr_reader :balance, :transactions

   def initialize
     @balance = 0
     @transactions = []
   end

   def update_balance(action)
     @balance += action.amount
   end

 end
