class RemoveSportFromMatches < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :sport, :string
  end
end
