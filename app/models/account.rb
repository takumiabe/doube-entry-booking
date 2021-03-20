class Account < ApplicationRecord
  has_many :account_statements, inverse_of: :account
  has_many :account_transactions, inverse_of: :account

  enum xacttype: { credit: 'cr', debit: 'dr' }
  validates :name, :xacttype, presence: true

  def current_statement
    last_statement = account_statements.where(date: Date.today.beginning_of_month).first

    xaction_this_month = account_transactions.where(created_at: Date.today.all_month)
    total_credit = xaction_this_month.where(xacttype_ext: [:adjust_credit, :deposit]).sum(:amount)
    total_debit = xaction_this_month.where.not(xacttype_ext: [:adjust_credit, :deposit]).sum(:amount)

    current_balance = (last_statement&.closing_balance || 0) + total_credit - total_debit

    {
      account: self.name,
      date: Date.today.beginning_of_month,
      total_credit: total_credit,
      total_debit: total_debit,
      current_balance: current_balance
    }
  end
end
