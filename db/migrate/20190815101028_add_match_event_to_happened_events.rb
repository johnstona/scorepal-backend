class AddMatchEventToHappenedEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :happened_events, :match_event, foreign_key: true
  end
end
