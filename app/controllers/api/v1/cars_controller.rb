class Api::V1::CarsController < ApplicationController
    # Never use NEW or EDIT

    def index
        @cars = Car.all
        render json: @cars.to_json(include: :sellers)
    end

    def show
        @car = Car.find(params[:id])
        render json: @car.to_json(include: :sellers)
    end

end
