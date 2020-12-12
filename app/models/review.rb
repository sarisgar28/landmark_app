class Review < ApplicationRecord
  
    belongs_to :user, optional: true 
    belongs_to :landmark
    validates :review, presence: true
    scope :with_user, -> { where(:user => current_user )}
  
end
