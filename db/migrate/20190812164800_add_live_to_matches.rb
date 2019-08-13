class AddLiveToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :live, :boolean
  end
end
