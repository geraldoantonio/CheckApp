class User < ApplicationRecord


  #Associations
  has_one :user_preferences, inverse_of: :user
  has_one :holder, inverse_of: :user
  accepts_nested_attributes_for :holder,
     reject_if: proc { |attributes| attributes[:name].blank? }
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
