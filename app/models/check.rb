class Check < ApplicationRecord
  belongs_to :account
  belongs_to :beneficiary

  monetize :amount_cents


  # Validates
  validates :number, :account_id, :date_discount, :beneficiary_id, :amount, presence: true


end
