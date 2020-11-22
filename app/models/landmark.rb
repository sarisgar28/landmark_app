class Landmark < ApplicationRecord
    belongs_to :users 
    belongs_to :city
    
end
