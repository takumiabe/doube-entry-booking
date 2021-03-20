class Ledger < ApplicationRecord
  has_many :account_transactions

  enum account_type: { asset: 'AA', liability: 'AL', revenue: 'RR', expense: 'RE', gain: 'GG', loss: 'GL' }
  validates :name, :account_type, presence: true
end
