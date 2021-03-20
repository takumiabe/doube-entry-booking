FactoryBot.define do
  factory :ledger do
    account_type { Ledger.account_types.keys.sample }
    name { "MyString" }
  end
end
