class LiveMatchChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'live_events_channel'
  end
end