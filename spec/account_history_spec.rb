describe AccountHistory do

  let(:transaction) { double :transaction, balance: :newbalance}
  let(:transaction_class) { double :transaction_class, new: transaction }
  let(:history) { described_class.new(transaction_class)}

  it 'starts a transaction' do
    expect(transaction_class).to receive(:new).with(50, 200)
    history.new_transaction(50, 200)
  end

  it 'returns the new balance' do
    expect(history.new_transaction("x", "y")).to equal :newbalance
  end

  it 'adds the transaction to the history' do
    history.new_transaction(50, 100)
    expect(history.history).to include transaction
  end

end
