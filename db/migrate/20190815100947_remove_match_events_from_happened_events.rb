class RemoveMatchEventsFromHappenedEvents < ActiveRecord::Migration[5.2]
  def change
    remove_reference :happened_events, :match_events, foreign_key: true
  end
end
