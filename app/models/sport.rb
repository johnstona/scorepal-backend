class Sport < ApplicationRecord
  has_many :matches
  has_many :score_events, dependent: :destroy
  has_many :match_events, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
