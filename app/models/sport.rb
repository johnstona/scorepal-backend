class Sport < ApplicationRecord
  has_many :matches
  has_many :score_events
  has_many :match_events

  validates :name, presence: true
  validates :name, uniqueness: true
end
