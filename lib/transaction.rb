class Transaction

  attr_reader :balance, :date, :amount

  def initialize(amount, balance, date = Time.now)
    @amount = amount
    @balance = balance + amount
    @date = date
  end

end
