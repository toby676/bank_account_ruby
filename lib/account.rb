require_relative 'account_history'
require_relative 'printer'

class Account

  attr_reader :balance, :account_history

  def initialize(account_history = AccountHistory.new, printer_class = Printer)
    @balance = 0
    @account_history = account_history
    @printer_class = printer_class
  end

  def deposit(amount, balance = @balance)
    @balance = @account_history.new_transaction(amount, balance)
  end

  def withdraw(amount, balance = @balance)
    amount = amount * -1
    @balance = @account_history.new_transaction(amount, balance)
  end

  def print_statement
    print @printer_class.new(@account_history.history).print_statement
  end

end
