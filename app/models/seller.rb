class Seller < ApplicationRecord
    has_many :seller_cars
    has_many :cars, through: :seller_cars
end
