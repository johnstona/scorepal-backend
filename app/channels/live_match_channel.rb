class LiveMatchChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'live_match_channel'
  end
end