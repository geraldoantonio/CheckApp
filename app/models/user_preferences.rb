class UserPreferences < ApplicationRecord
    
  belongs_to :user, inverse_of: :user_preferences
  accepts_nested_attributes_for :user

  monetize :check_value_featured_cents
  
end
