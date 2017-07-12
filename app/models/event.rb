class Event < ActiveRecord::Base
    belongs_to :user
    
    def self.search(search)
      # Title is for the above case, the OP incorrectly had 'name'
      where("title LIKE ?", "%#{search}%")
    end
end
