class CreateLedgers < ActiveRecord::Migration[6.1]
  def change
    create_table :ledgers do |t|
      t.string :account_type
      t.string :name

      t.timestamps
    end
  end
end
