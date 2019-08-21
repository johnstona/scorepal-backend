class ScoreEvent < ApplicationRecord
  belongs_to :sport
  has_many :happened_score_events
end
