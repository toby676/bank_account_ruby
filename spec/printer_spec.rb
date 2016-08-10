describe Printer do

  let(:transaction1) {Transaction.new(1000, 0, Time.new(2012, 01, 10))}
  let(:transaction2) {Transaction.new(2000, 1000, Time.new(2012, 01, 13))}
  let(:transaction3) {Transaction.new(-500, 3000, Time.new(2012, 01, 14))}
  let(:account_history) {[transaction1, transaction2, transaction3]}
  let(:printer) {described_class.new(account_history)}

  it 'prints out the account history' do

    expect(printer.print_statement).to eql "date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
"

  end

end
