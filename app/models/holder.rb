class Holder < ApplicationRecord

  has_many :accounts
  has_many :beneficiaries
  belongs_to :user, inverse_of: :holder

  validates :name, presence: true
  
end
