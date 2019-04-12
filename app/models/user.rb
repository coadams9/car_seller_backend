class User < ApplicationRecord
    has_secure_password
    has_many :user_cars
    has_many :cars, through: :user_cars
    validates :name, :phoneNum, presence: true, uniqueness: true
end
