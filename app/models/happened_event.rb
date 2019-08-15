class HappenedEvent < ApplicationRecord
  belongs_to :match
  belongs_to :match_event
end
