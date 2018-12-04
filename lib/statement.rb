# This class handles the statement of transactions of an account
class Statement
  attr_reader :account

  def initialize(account)
    @transactions = account.transactions
  end

  def transactions
    string = "date || credit || debit || balance\n"
    @transactions.each { |transaction| string += transaction + "\n" }
    string.chomp
  end
end
