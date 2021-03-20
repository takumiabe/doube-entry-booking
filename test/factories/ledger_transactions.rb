FactoryBot.define do
  factory :ledger_transaction do
    ledger
    association :ledger_cr, factory: :ledger
    amount { 1000 }
  end
end
