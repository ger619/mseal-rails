class AddActiveToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :active, :boolean
  end
end
