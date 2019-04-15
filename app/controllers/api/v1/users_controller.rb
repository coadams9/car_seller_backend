class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users.to_json(include: :cars)
  end

  def show
    @user = User.find(params[:id])
    render json: @user.to_json(include: :cars)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      token = JWT.encode(userId: @user.id)
      render json: { username: @user.username, token: token }, status: :created
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.permit(:username, :password, :phoneNum)
  end


end
