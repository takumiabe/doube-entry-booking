class LedgerTransaction < ApplicationRecord
  belongs_to :ledger, inverse_of: :ledger_transactions
  belongs_to :ledger_cr, inverse_of: :ledger_credit_transactions, class_name: 'Ledger'
end
