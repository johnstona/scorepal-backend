class HappenedEventsController < ApplicationController
  def create
    @happened_event = HappenedEvent.create happened_event_params
    ActionCable.server.broadcast('live_match_channel', {@happened_event, @happened_event.match})
    render json: @happened_event, except: :updated_at
  end

  private 

  def happened_event_params
    params.require(:happened_event).permit(:id, :match_id, :match_event_id, :player)
  end
end
