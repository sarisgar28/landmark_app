class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :landmarks, through: :reviews

    validates :username, presence: true
    validates :email, presence: true
   
    
end
