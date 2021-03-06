feature 'Print account statement' do
  scenario "it can print the account's transactions" do
    account = Account.new
    credit = Credit.new(1000, '10/01/2012')
    account.add_transaction(credit, Transaction)
    statement = Statement.new(account)
    expect(statement.transactions).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00")

    credit2 = Credit.new(2000, '13/01/2012')
    account.add_transaction(credit2, Transaction)
    expect(statement.transactions).to eq("date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")

    debit = Debit.new(500, '14/01/2012')
    account.add_transaction(debit, Transaction)
    expect(statement.transactions).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")
  end
end
