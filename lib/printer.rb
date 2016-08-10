class Printer

  def initialize(account_history)
    @account_history = account_history
    @string = "date || credit || debit || balance\n"
  end

  def print_statement
    format_statement
    print @string
  end

  private
  def format_statement
    @account_history.reverse.collect do |transaction|
    @string << "#{transaction.date.strftime('%d/%m/%Y')} || "
      if transaction.amount < 0
        @string << "|| #{'%.2f' % -transaction.amount} || "
      else
        @string << "#{'%.2f' % transaction.amount} || || "
      end
    @string << "#{'%.2f' % transaction.balance}\n"
    end
  end

end
