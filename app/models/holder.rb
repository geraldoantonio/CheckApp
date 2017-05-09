class Holder < ApplicationRecord

  has_many :accounts, dependent: :delete_all
  has_many :beneficiaries, dependent: :delete_all
  belongs_to :user, inverse_of: :holder
  accepts_nested_attributes_for :user

  validates :name, presence: true
  
end
