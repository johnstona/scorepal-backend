class AddPlayerOptionToMatchEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :match_events, :player_option, :boolean
  end
end
