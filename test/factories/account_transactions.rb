FactoryBot.define do
  factory :account_transaction do
    ledger { nil }
    account { nil }
    xacttype { "MyString" }
    xacttype_ext { "MyString" }
    amount { 1 }
  end
end
