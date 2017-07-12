class Group < ActiveRecord::Base
  
    belongs_to :user
    
    has_many :emails
    
    def self.search(search)
      # Title is for the above case, the OP incorrectly had 'name'
      where("title LIKE ?", "%#{search}%")
    end
end