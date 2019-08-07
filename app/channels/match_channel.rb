class MatchChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'match_channel'
  end
end