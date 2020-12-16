class Landmark < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
    

    validates :name, presence: true, uniqueness: true
    validates :city, presence: true
    validates :country, presence: true
    validates :description, presence: true
   
    scope :ordered_by_name, -> { order(name: :asc)}
    scope :search_by, ->(param, val){ where("#{param} LIKE ?", "%#{val}%")}
end
