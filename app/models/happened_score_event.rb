class HappenedScoreEvent < ApplicationRecord
  belongs_to :score_event
  belongs_to :match
end
