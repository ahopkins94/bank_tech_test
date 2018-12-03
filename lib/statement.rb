class Statement
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def transactions
    string = "date || credit || debit || balance\n"
    @account.transactions.each { |transaction| string += transaction + "\n" }
    string.chomp
  end
end
