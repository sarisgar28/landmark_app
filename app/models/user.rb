class User < ApplicationRecord
    has_secure_password

    has_many :reviews 
    has_many :landmarks, through: :reviews

    validates :username, presence: true
    validates_associated :landmarks
    validates :password, length: { in: 6..20 }
end
