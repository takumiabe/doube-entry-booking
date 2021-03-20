# 受託販売会計
# あってる？

consignor = Account.create!(name: '委託者A', xacttype: :debit)
cash = Ledger.create!(name: '現金', account_type: :asset)
fee = Ledger.create!(name: '手数料', account_type: :revenue)
consignment_debt = Ledger.create!(name: '受託販売A', account_type: :liability)

def consignment_sell(consignment_debt, amount, customer_name)
  cash = Ledger.where(name: '現金').first!
  fee = Ledger.where(name: '手数料').first!

  customer = Account.where(name: customer_name).first_or_create! do |new_account|
    new_account.xacttype = :debit
  end

  # 代金の生成
  customer.deposit(amount)
  # 販売代金受け取り
  LedgerTransaction.create!(ledger: cash, ledger_cr: consignment_debt, amount: amount)
  # 販売手数料
  LedgerTransaction.create!(ledger: consignment_debt, ledger_cr: fee, amount: (amount * 0.1r).floor)
end

# 受託販売
consignment_sell(consignment_debt, 1000, 'お客さんA')
consignment_sell(consignment_debt, 2000, 'お客さんB')
consignment_sell(consignment_debt, 1980, 'お客さんA')

p consignment_debt.current_statement

# 申請された額を払う
LedgerTransaction.create!(ledger: consignment_debt, ledger_cr: fee, amount: 700) # 振込手数料

sales = consignment_debt.current_statement[:current_balance]
LedgerTransaction.create!(ledger: consignment_debt, ledger_cr: cash, amount: sales)
AccountTransaction.create!(ledger: cash, account: consignor, xacttype: :debit, xacttype_ext: :deposit, amount: sales)
p consignment_debt.current_statement

if consignor.withdraw(2000)
  p "2000円引き出し完了"
else
  p "2000円引き出し失敗"
end

p consignment_debt.current_statement
