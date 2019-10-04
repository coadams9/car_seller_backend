class Api::V1::CarsController < ApplicationController
    # Never use NEW or EDIT

  def index
    @cars = Car.all
    render json: @cars.to_json(include: :users)
  end

  def show
    @car = Car.find(params[:id])
    render json: @car.to_json(include: :users)
  end

  def create
    @user = current_user
    @new_car = Car.new(car_params)
    @new_car.users << @user
    if @new_car.save
      render json: @new_car
    else
      render json: { new_car_errors: @new_car.errors.full_messages }
    end
  end


  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    if @car.save
      render json: @car.to_json(include: :users)
    else
      render json: @car.errors.full_messages
    end
  end

  private

  def user_params
    params.permit(users: [:name, :password, :phoneNum])
  end

  def car_params
    params.permit(:make, :modelMake, :year, :color, :image, :description, :price, :favorite)
  end

end
