class User < ApplicationRecord
    has_secure_password
    has_many :user_cars
    has_many :cars, through: :user_cars
    validates :username, :phoneNum, presence: true, uniqueness: true
    validates :phoneNum, numericality: { only_integer: true }
end
