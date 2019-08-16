class HappenedEventsController < ApplicationController
  def show
    @happened_event = HappenedEvent.find happened_event_params
    render json: HappenedEventSerializer.new(@happened_event)
  end

  def create
    @happened_event = HappenedEvent.create happened_event_params
    @match = @happened_event.match
    ActionCable.server.broadcast('live_match_channel', MatchSerializer.new(@match))
    render json: HappenedEventSerializer.new(@happened_event)
  end

  private 

  def happened_event_params
    params.require(:happened_event).permit(:id, :match_id, :match_event_id, :player)
  end
end
