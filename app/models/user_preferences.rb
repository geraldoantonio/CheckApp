class UserPreferences < ApplicationRecord
    
  belongs_to :user, inverse_of: :user_preferences

  monetize :check_value_featured_cents
  
end
