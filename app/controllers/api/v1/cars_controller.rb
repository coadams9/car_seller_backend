class Api::V1::CarsController < ApplicationController

    def index
        # @cars = Cars.all
        # render json: cars
        render json: Car.all
    end

    def show
        # @car = Car.find(params[:id])
        # render json: car.to_json(include: [:sellers])
        car = Car.find(params[:id])
        render json: car
    end
end
