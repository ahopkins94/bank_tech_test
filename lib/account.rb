 class Account

   attr_reader :balance

   def initialize
     @balance = 0
   end

   def update_balance(action)
     @balance += action.amount
   end

 end
