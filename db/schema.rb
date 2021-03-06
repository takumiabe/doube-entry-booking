# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_20_095201) do

  create_table "account_statements", force: :cascade do |t|
    t.integer "account_id", null: false
    t.date "date"
    t.integer "closing_balance"
    t.integer "total_credit"
    t.integer "total_debit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_statements_on_account_id"
  end

  create_table "account_transactions", force: :cascade do |t|
    t.integer "ledger_id", null: false
    t.integer "account_id", null: false
    t.string "xacttype"
    t.string "xacttype_ext"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_transactions_on_account_id"
    t.index ["ledger_id"], name: "index_account_transactions_on_ledger_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "xacttype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ledger_transactions", force: :cascade do |t|
    t.integer "ledger_id", null: false
    t.integer "ledger_cr_id", null: false
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ledger_cr_id"], name: "index_ledger_transactions_on_ledger_cr_id"
    t.index ["ledger_id"], name: "index_ledger_transactions_on_ledger_id"
  end

  create_table "ledgers", force: :cascade do |t|
    t.string "account_type"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "account_statements", "accounts"
  add_foreign_key "account_transactions", "accounts"
  add_foreign_key "account_transactions", "ledgers"
  add_foreign_key "ledger_transactions", "ledgers"
  add_foreign_key "ledger_transactions", "ledgers", column: "ledger_cr_id"
end
