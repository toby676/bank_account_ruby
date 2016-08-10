describe Account do

  let(:prints) {double :prints, print_statement: ''}
  let(:printer) {double :printer, new: prints}
  let(:account_history) {double :account_history, history: ''}
  let(:account) { described_class.new(account_history, printer) }

  it 'user can see initial balance of 0' do
    expect(account.balance).to equal 0
  end

  it 'allows user to deposit money into their account' do
    expect(account_history).to receive(:new_transaction).with(50,200)
    account.deposit(50,200)
  end

  it 'allows user to withdraw money from their account' do
    expect(account_history).to receive(:new_transaction).with(-50,200)
    account.withdraw(50,200)
  end

  it 'allows user print statement' do
    expect(prints).to receive(:print_statement)
    account.print_statement
  end

end
