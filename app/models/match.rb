class Match < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :happened_events, dependent: :destroy
end
