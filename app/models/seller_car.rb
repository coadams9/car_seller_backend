class SellerCar < ApplicationRecord
    belongs_to :car
    belongs_to :sellers
end
