describe Transaction do

  let(:transaction) { described_class }

  it 'returns the new balance' do
    trans = transaction.new(100,50)
    expect(trans.balance).to equal 150
  end

end
