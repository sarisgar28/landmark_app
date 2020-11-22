class City < ApplicationRecord
    has_many :landmarks 
    has_many :users through :landmarks
end
