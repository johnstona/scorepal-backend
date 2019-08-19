class AddPlayerOptionToScoreEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :score_events, :player_option, :boolean
  end
end
