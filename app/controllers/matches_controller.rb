class MatchesController < ApplicationController
  before_action :find_match, only: [:show, :update, :destroy]
  
  def index
    matches = Match.all
    render json: MatchIndexSerializer.new(matches), except: [:updated_at, :created_at]
  end
  
  def create
    @match = Match.create match_params
    ActionCable.server.broadcast('match_channel', @match)
    render json: @match, except: [:updated_at, :created_at]
  end
  
  def show
    render json: MatchSerializer.new(@match)
  end
  
  def update
    @match.update match_params
    ActionCable.server.broadcast('match_channel', @match)
    render json: @match, except: [:password, :updated_at, :created_at]
  end
  
  def destroy
  end

  private

  def find_match
    @match = Match.find params[:id]
  end

  def match_params
    params.require(:match).permit(:id, :user_id, :sport_id, :opponent_id, :opponent_name, :user_score, :opponent_score, :live)
  end
end
