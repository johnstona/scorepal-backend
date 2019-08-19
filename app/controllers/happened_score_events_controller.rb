class HappenedScoreEventsController < ApplicationController
  def create
    @happened_score_event = HappenedScoreEvent.create happened_score_event_params
    @match = @happened_score_event.match
    ActionCable.server.broadcast('live_match_channel', MatchSerializer.new(@match))
    render json: @happened_score_event, except: :updated_at
  end

  private 

  def happened_score_event_params
    params.require(:happened_score_event).permit(:id, :match_id, :score_event_id, :player, :player_name)
  end
end
