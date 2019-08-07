class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :sport
      t.integer :opponent_id
      t.string :opponent_name
      t.integer :user_score
      t.integer :opponent_score
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
