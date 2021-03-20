class CreateAccountStatements < ActiveRecord::Migration[6.1]
  def change
    create_table :account_statements do |t|
      t.references :account, null: false, foreign_key: true
      t.date :date
      t.integer :closing_balance
      t.integer :total_credit
      t.integer :total_debit

      t.timestamps
    end
  end
end
