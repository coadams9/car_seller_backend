class Api::V1::AuthController < ApplicationController

   def create
      @user = User.find_by(username: login_params[:username])
      if @user && @user.authenticate(login_params[:password])
         token = JWT.encode({ userId: @user.id }, ENV['SECRET'])
         render json: { username: @user.username, token: token }, status: :accepted
      else
         render json: { error: 'Nope' }, status: :unauthorized
      end
   end





   private

   def login_params 
      params.permit(:username, :password)
   end



end