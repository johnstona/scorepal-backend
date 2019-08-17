class MatchIndexSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_score, :opponent_name, :opponent_id, :opponent_score, :live, :user, :sport
end
