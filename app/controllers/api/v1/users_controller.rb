class Api::V1::UsersController < ApplicationController

  def index
    users = Users.all
    render json: users
  end
end
