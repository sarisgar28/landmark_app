class User < ApplicationRecord
    has_secure_password

    has_many :landmarks 
    has_many :cities, through: :landmarks 

    validates :username, presence: true
    validates_associated :landmarks
    validates :password, length: { in: 6..20 }
end
