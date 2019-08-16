class HappenedEventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :match, :match_event, :player, :created_at
end
