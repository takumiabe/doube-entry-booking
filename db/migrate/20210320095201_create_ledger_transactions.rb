class CreateLedgerTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :ledger_transactions do |t|
      t.references :ledger, null: false, foreign_key: true
      t.references :ledger_cr, null: false, foreign_key: { to_table: :ledgers }
      t.integer :amount

      t.timestamps
    end
  end
end
