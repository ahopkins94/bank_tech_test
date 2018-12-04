# This class handles the date and amount of a debit
class Debit
  attr_reader :amount, :date

  def initialize(amount, date = Time.now.strftime('%d/%m/%Y'))
    @amount = -amount
    @date = date
  end
end
