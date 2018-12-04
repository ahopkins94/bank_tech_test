# This class handles the statement of transactions of an account
class Statement
  attr_reader :account

  def initialize(account)
    @transactions = account.transactions
  end

  def transactions
    string = "date || credit || debit || balance\n"
    @transactions.each { |transaction| string += format(transaction) + "\n" }
    string.chomp
  end

  private

  def format(transaction)
    return "#{transaction.date} || || #{sprintf('%.2f', -transaction.amount)} || #{sprintf('%.2f', transaction.balance)}" if transaction.amount < 0

    return "#{transaction.date} || #{sprintf('%.2f', transaction.amount)} || || #{sprintf('%.2f', transaction.balance)}"
  end
end
