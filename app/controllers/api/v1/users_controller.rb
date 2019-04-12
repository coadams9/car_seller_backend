class Api::V1::UsersController < ApplicationController
  # Never use NEW or EDIT

  def index
    @users = User.all
    render json: @users.to_json(include: :cars)
  end

  def show
    @user = User.find(params[:id])
    render json: @user.to_json(include: :cars)
  end

  def create
    @user = User.create(user_params)
  end


  private

  def user_params
    params.permit(:name, :password, :phoneNum)
  end


end
