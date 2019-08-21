class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]
  
  def index
    users = User.all
    render json: users, except: [:updated_at, :created_at]
  end
  
  def create
    @user = User.create user_params
    if @user.id
      render json: @user, except: [:password, :updated_at, :created_at]
    else
      render json: { message: 'Signup failed. Please try again.' }
    end
  end
  
  def show
    render json: @user, except: [:password, :updated_at, :created_at]
  end
  
  def update
    @user.update user_params
    render json: @user, except: [:password, :updated_at, :created_at]
  end
  
  def destroy
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render json: @users, except: [:password, :created_at, :updated_at]
  end
  
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render json: @users, except: [:password, :created_at, :updated_at]
  end

  def matches
    @title = "Matches"
    @user = User.find(params[:id])
    @matches = Match.where(user_id: @user.id).or(Match.where(opponent_id: @user.id))
    render json: @matches, except: [:created_at, :updated_at]
  end
  
  
  private
  
  def find_user
    @user = User.find params[:id]
  end
  
  def user_params
    params.require(:user).permit(:id, :username, :name, :password, :avatar)
  end

end
