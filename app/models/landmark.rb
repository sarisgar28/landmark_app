class Landmark < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
    scope :find_name, -> (name) {find_by(name: name)}

    validates :name, presence: true
    validates :city, presence: true
    validates :country, presence: true
    validates :description, presence: true

end
