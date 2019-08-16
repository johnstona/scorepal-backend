class CreateHappenedScoreEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :happened_score_events do |t|
      t.string :player
      t.references :score_event, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
