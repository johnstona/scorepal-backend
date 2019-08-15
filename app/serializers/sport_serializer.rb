class SportSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :score_events, :match_events
end