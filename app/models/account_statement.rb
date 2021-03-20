class AccountStatement < ApplicationRecord
  belongs_to :account, inverse_of: :account_statements

  validates :date, :closing_balance, :total_credit, :total_debit, presence: true
end
