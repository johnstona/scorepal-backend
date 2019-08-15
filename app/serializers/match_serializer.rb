class MatchSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_score, :opponent_name, :opponent_id, :opponent_score, :live, :sport, :user, :happened_events
end
