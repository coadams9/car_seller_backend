class Api::V1::CarsController < ApplicationController

  def index
    cars = Cars.all
    render json: cars
  end
end
