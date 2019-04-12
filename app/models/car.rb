class Car < ApplicationRecord
    has_many :user_cars
    has_many :users, through: :user_cars
    validates :make, :modelMake, :year, :color, :image, :price, presence: true
    # accepts_nested_attributes_for :sellers
end
