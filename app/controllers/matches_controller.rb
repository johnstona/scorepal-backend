class MatchesController < ApplicationController
  before_action :find_match, only: [:show, :update, :destroy]
  
  def index
    matches = Match.all
    render json: matches, except: [:updated_at, :created_at]
  end
  
  def create
    @match = Match.create match_params
    render json: @match, except: [:updated_at, :created_at]
  end
  
  def show
    render json: @match, except: [:password, :updated_at, :created_at]
  end
  
  def update
    @match.update match_params
    render json: @match, except: [:password, :updated_at, :created_at]
  end
  
  def destroy
  end

  private

  def find_match
    @match = Match.find params[:id]
  end

  def match_params
    params.require(:quiz).permit(:id, :user_id, :sport, :opponent_id, :opponent_name, :user_score, :opponent_score)
  end
end
