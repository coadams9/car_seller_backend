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
    @car = Car.new(car_params)
    @user = @car.users.build(user_params['users'][0])
    if @car.save
      render json: @car.to_json(include: :users)
    else
      render json: {
        car_errors: @car.errors.full_messages,
        seller_errors: @user.errors.full_messages
      }
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
