class CreateScoreEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :score_events do |t|
      t.string :name
      t.integer :point_value
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
