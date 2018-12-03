class Statement

  attr_reader :account

  def initialize(account)
    @account = account
  end

  def transactions
    string = "date || credit || debit || balance\n"
    @account.transactions.each do |transaction|
      string += transaction + "\n"
    end
    return string.chomp
  end

end
