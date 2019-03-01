class Api::V1::CarsController < ApplicationController

    def index
        @cars = Car.all
        render json: @cars.to_json(include: :sellers)
    end

    def show
        @car = Car.find(params[:id])
        render json: @car.to_json(include: :sellers)
    end

    # Never use NEW or EDIT
end
