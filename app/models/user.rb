class User < ActiveRecord::Base
    
    has_secure_password 
    
    has_many :events
    has_many :groups
    
    def editor? 
      self.role == 'editor' 
    end
    
    def admin? 
      self.role == 'admin' 
    end
    
end
