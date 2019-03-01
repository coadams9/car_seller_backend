class Api::V1::SellersController < ApplicationController
    # Never use NEW or EDIT

    def index
        @sellers = Seller.all
        render json: @sellers.to_json(include: :cars)
    end

    def show
        @seller = Seller.find(params[:id])
        render json: @seller.to_json(include: :cars)
    end
end
