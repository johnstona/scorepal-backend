class RelationshipsController < ApplicationController

  def index
    relationships = Relationship.all
    render json: relationships, except: [:updated_at, :created_at]
  end

  def create
    user1 = User.find(params[:follower_id])
    user2 = User.find(params[:followed_id])
    user1.follow(user2)
  end

  def destroy
    user1 = User.find(params[:id])
    user2 = User.find(params[:follower_id])
    user2.unfollow(user1)
  end

end
