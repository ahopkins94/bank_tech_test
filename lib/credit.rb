# This class holds the amount and date information about a credit
class Credit
  attr_reader :amount, :date

  def initialize(amount, date = Time.now.strftime('%d/%m/%Y'))
    @amount = amount
    @date = date
  end
end
