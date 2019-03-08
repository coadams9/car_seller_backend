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

  def create
    @car = Car.new(car_params)
    @seller = @car.sellers.build(seller_params['sellers'][0])
    if @car.save
      render json: @car.to_json(include: :sellers)
    else
      render json: {
        car_errors: @car.errors.full_messages,
        seller_errors: @seller.errors.full_messages
      }
    end
  end


  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    if @car.save
      render json: @car.to_json(include: :sellers)
    else
      render json: @car.errors.full_messages
    end
  end

  private

  def seller_params
    params.permit(sellers: [:name, :email, :phoneNum])
  end

  def car_params
    params.permit(:make, :modelMake, :year, :color, :image, :description, :price, :favorite)
  end

end
