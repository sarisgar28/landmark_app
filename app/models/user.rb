class User < ApplicationRecord
    has_many :landmarks 
    has_many :cities through :landmarks 
end
