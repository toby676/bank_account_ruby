describe Printer do

  let(:transaction1) {double :transaction1, amount: 1000, balance: 1000, date: Time.new(2012, 01, 10)}
  let(:transaction2) {double :transaction2, amount: 2000, balance: 3000, date: Time.new(2012, 01, 13)}
  let(:transaction3) {double :transaction3, amount: -500, balance: 2500, date: Time.new(2012, 01, 14)}
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
