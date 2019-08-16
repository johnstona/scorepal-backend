class HappenedScoreEventsController < ApplicationController
  def create
    @happened_score_event = HappenedScoreEvent.create happened_event_params
    ActionCable.server.broadcast('live_match_channel', {@happened_score_event, @happened_score_event.match})
    render json: @happened_score_event, except: :updated_at
  end

  private 

  def happened_score_event_params
    params.require(:happened_score_event).permit(:id, :match_id, :score_event_id, :player)
  end
end
