## Bank Tech Test

# My Approach:

I read the requirements and acceptance criteria for the test and brain stormed what classes I would need and how they would interact with each other e.g. a statement would need an account and an account would need credit or debit to complete a transaction. From there I began to test drive my code in small chunks in order to build up to a big feature test that passes.

# My Structure:

The account class' responsibility is to react to credits and debits appropriately. The credit and debit classes' responsibility was to hold an amount and a date. I chose this approach so that only credits and debits could be transacted and not other objects. The statement class' responsibility is to print the transactions in the layout required.

# Testing:

$ bundle install
$ rspec

Tests are run with simple-coverage

# Dependencies:

- Pry (chosen for binding.pry debugging purposes)
- Rubocop (chosen linter, confident using with ruby)
- Capybara (chosen for feature test writing readability)
- Rspec (chosen for running tests, confident using with ruby and good readability)
- Simplecov (chosen for thorough coverage testing and good readability)

# Running the app in pry:

`➜  bank-tech-test git:(master) ✗ pry
[1] pry(main)> require './lib/account'
=> true
[2] pry(main)> require './lib/credit'
=> true
[3] pry(main)> require './lib/debit'
=> true
[4] pry(main)> require './lib/statement'
=> true
[5] pry(main)> account = Account.new
=> #<Account:0x00007fd325adf840 @balance=0, @transactions=[]>
[6] pry(main)> credit = Credit.new(500)
=> #<Credit:0x00007fd325b09c30 @amount=500, @date="03/12/2018">
[7] pry(main)> account.transaction(credit)
=> ["03/12/2018 || 500.00 || || 500.00"]
[8] pry(main)> account
=> #<Account:0x00007fd325adf840
 @balance=500,
 @transactions=["03/12/2018 || 500.00 || || 500.00"]>
[9] pry(main)> debit = Debit.new(300)
=> #<Debit:0x00007fd325b9f6e0 @amount=-300, @date="03/12/2018">
[10] pry(main)> account.transaction(debit)
=> ["03/12/2018 || || 300.00 || 200.00", "03/12/2018 || 500.00 || || 500.00"]
[11] pry(main)> account
=> #<Account:0x00007fd325adf840
 @balance=200,
 @transactions=
  ["03/12/2018 || || 300.00 || 200.00", "03/12/2018 || 500.00 || || 500.00"]>
[12] pry(main)> statement = Statement.new(account)
=> #<Statement:0x00007fd326215ab0
 @account=
  #<Account:0x00007fd325adf840
   @balance=200,
   @transactions=
    ["03/12/2018 || || 300.00 || 200.00",
     "03/12/2018 || 500.00 || || 500.00"]>>
[13] pry(main)> statement.transactions
=> "date || credit || debit || balance\n03/12/2018 || || 300.00 || 200.00\n03/12/2018 || 500.00 || || 500.00"`
