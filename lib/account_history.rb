require_relative 'transaction'

class AccountHistory

  attr_reader :history

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @history = []
  end

  def new_transaction(amount, balance)
    trans = @transaction_class.new(amount, balance)
    @history << trans
    trans.balance
  end

end
