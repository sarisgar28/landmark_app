class Review < ApplicationRecord
  
    belongs_to :user 
    belongs_to :landmark
    validates :review, presence: true
end
