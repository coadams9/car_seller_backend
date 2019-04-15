class Api::V1::AuthController < ApplicationController

   def create
      @user = User.find_by(token: params[:token])
      if @user && @user.authenticate(params)

   end





   private

   def login_params 
      params.permit(:token)
   end



end