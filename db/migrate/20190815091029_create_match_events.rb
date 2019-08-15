class CreateMatchEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :match_events do |t|
      t.string :name
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
