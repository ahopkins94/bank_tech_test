## Bank Tech Test

# My Approach:

I read the requirements and acceptance criteria for the test and brain stormed what classes I would need and how they would interact with each other e.g. a statement would need an account and an account would need credit or debit to complete a transaction. From there I began to test drive my code in small chunks in order to build up to a big feature test that passes. At the end I refactored further where possible

# My Structure:

The account class' responsibility is to hold the balance and transactions of an account. The credit and debit classes' responsibility is to hold an amount and a date. I chose this approach so that only credits and debits could be transacted and not other objects. The transaction controller class' responsibility is to handle the creation of transactions. The statement class' responsibility is to print the transactions of an account in the layout required.

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
[2] pry(main)> require './lib/transaction_controller'
=> true
[3] pry(main)> require './lib/statement'
=> true
[4] pry(main)> require './lib/debit'
=> true
[5] pry(main)> require './lib/credit'
=> true
[6] pry(main)> account = Account.new
=> #<Account:0x00007f95f6a1ad18 @balance=0, @transactions=[]>
[7] pry(main)> transaction_controller = TransactionController.new(account)
=> #<TransactionController:0x00007f95f72d4760 @balance=0, @transactions=[]>
[8] pry(main)> credit = Credit.new(500)
=> #<Credit:0x00007f95f731fb98 @amount=500, @date="04/12/2018">
[9] pry(main)> transaction_controller.create(credit)
=> ["04/12/2018 || 500.00 || || 500.00"]
[10] pry(main)> debit = Debit.new(300)
=> #<Debit:0x00007f95f6a3eec0 @amount=-300, @date="04/12/2018">
[11] pry(main)> transaction_controller.create(debit)
=> ["04/12/2018 || || 300.00 || 200.00", "04/12/2018 || 500.00 || || 500.00"]
[12] pry(main)> statement = Statement.new(account)
=> #<Statement:0x00007f95f6953bf0
 @transactions=
  ["04/12/2018 || || 300.00 || 200.00", "04/12/2018 || 500.00 || || 500.00"]>
[13] pry(main)> statement.transactions
=> "date || credit || debit || balance\n04/12/2018 || || 300.00 || 200.00\n04/12/2018 || 500.00 || || 500.00"`
