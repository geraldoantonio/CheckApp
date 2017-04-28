class Beneficiary < ApplicationRecord
  
  has_many :checks
  belongs_to :holder

  validates :name, :holder_id, presence: true
  
    
end
