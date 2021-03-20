class Account < ApplicationRecord
  enum xacttype: { credit: 'cr', debit: 'dr' }
  validates :name, :xacttype, presence: true
end
