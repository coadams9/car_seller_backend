class Car < ApplicationRecord
    has_many :seller_cars
    has_many :sellers, through: :seller_cars
    validates :make, :modelMake, :year, :color, :image, :price, presence: true
    # accepts_nested_attributes_for :sellers
end
