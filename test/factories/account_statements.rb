FactoryBot.define do
  factory :account_statement do
    account { nil }
    date { "2021-03-20" }
    closing_balance { 1 }
    total_credit { 1 }
    total_debit { 1 }
  end
end
