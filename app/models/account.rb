class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :holder
  has_many :checks




  # Validates
  validates :number, :bank_id, :holder_id, :agency_code,  presence: true

  #Scopes
  scope :to_user, -> (user, page){
             where(:holder_id => user).page(page) 
           }

  scope :to_user_valid, -> (user, account_id){
            select(:id).where(:holder_id => user).where(:id => account_id)
  }

end
