class Review < ApplicationRecord
  
    belongs_to :user, optional: true 
    belongs_to :landmark
    validates :review, presence: true
    
   
  
end
