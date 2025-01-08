class RemoveMpFromTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :tables, :mp
  end
end
