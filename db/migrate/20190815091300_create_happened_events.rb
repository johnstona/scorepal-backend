class CreateHappenedEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :happened_events do |t|
      t.string :player
      t.references :match, foreign_key: true
      t.references :match_events, foreign_key: true

      t.timestamps
    end
  end
end
