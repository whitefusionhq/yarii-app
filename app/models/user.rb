class User < ApplicationRecord
  authenticates_with_sorcery!
  
  def can_access_yarii?
    # more sophisticated roles-based permissions could be looked at here
    # but for now every user can access Yarii
    
    true
  end
end
