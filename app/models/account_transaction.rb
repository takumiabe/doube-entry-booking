class AccountTransaction < ApplicationRecord
  belongs_to :ledger, inverse_of: :account_transactions
  belongs_to :account, inverse_of: :account_transactions

  enum xacttype: { credit: 'cr', debit: 'dr' }
  enum xacttype_ext: { adjust_credit: 'AC',  adjust_debit: 'AD', deposit: 'Dp', withdrawal: 'Wd' }

  validates :amount, :xacttype, :xacttype_ext, presence: true
end
