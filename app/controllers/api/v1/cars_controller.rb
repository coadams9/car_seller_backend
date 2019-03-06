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

    def update
        @car = Car.find(params[:id])
        @car.update(car_params)
        render json: @car.to_json(include: :sellers)
    end


    private
    def car_params
        params.require(:car).permit(:favorite)
    end

end
