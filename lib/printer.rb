class Printer

  def initialize(account_history)
    @account_history = account_history
    @string = ""
  end

  def print_statement
    prepare_statement
    "date || credit || debit || balance\n" + @string
  end

  private

  def format_line(transaction)
    "#{transaction.date.strftime('%d/%m/%Y')} || " +
    (transaction.amount < 0 ? "|| #{'%.2f' % -transaction.amount} || " : "#{'%.2f' % transaction.amount} || || ") +
    "#{'%.2f' % transaction.balance}\n"
  end

  def prepare_statement
    @account_history.reverse.each do |transaction|
      @string << format_line(transaction)
    end
  end

end
