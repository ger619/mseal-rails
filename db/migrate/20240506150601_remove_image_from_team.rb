class RemoveImageFromTeam < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :image, :string
  end
end
