class AuthController < ApplicationController

  def create
    @user = User.find_by(username: user_login_params[:username])
    
    if @user
        render json: @user, except: [:password, :updated_at, :created_at]
    else
        render json: { message: 'Invalid username or password' }
    end
end

  private

    def user_login_params
        params.permit(:username, :password)
    end
end