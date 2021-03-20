class CreateAccountTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :account_transactions do |t|
      t.references :ledger, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.string :xacttype
      t.string :xacttype_ext
      t.integer :amount

      t.timestamps
    end
  end
end
