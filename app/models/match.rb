class Match < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :happened_events, dependent: :destroy
  has_many :match_events, through: :happened_events
end
