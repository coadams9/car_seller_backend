class Seller < ApplicationRecord
    has_many :seller_cars
    has_many :cars, through: :seller_cars
    # validates :name, :email, :phoneNum, presence: true, uniqueness: true
end
