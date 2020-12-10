class Landmark < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
    scope :find_name, -> (name) {find_by(name: name)}

end
