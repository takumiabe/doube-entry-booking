class Account < ApplicationRecord
  has_many :account_statements, inverse_of: :account

  enum xacttype: { credit: 'cr', debit: 'dr' }
  validates :name, :xacttype, presence: true
end
