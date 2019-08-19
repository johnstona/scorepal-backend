class AddPlayerNameToHappenedEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :happened_events, :player_name, :string
  end
end
