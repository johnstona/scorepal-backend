class MatchEvent < ApplicationRecord
  belongs_to :sport
  has_many :happened_events
end
