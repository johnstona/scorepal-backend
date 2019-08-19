class AddPlayerNameToHappenedScoreEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :happened_score_events, :player_name, :string
  end
end
