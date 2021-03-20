class Ledger < ApplicationRecord
  has_many :account_transactions
  has_many :ledger_transactions, inverse_of: :ledger
  has_many :ledger_credit_transactions, inverse_of: :ledger_cr, class_name: 'LedgerTransaction', foreign_key: :ledger_cr_id

  enum account_type: { asset: 'AA', liability: 'AL', revenue: 'RR', expense: 'RE', gain: 'GG', loss: 'GL' }
  validates :name, :account_type, presence: true
end
