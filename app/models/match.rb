class Match < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :happened_events, dependent: :destroy
  has_many :match_events, through: :happened_events
  has_many :happened_score_events, dependent: :destroy
  has_many :score_events, through: :happened_score_events

  validates :opponent_name, presence: { if: -> { opponent_id.blank? } }
  validates :opponent_id, presence: { if: -> { opponent_name.blank? } }

end
