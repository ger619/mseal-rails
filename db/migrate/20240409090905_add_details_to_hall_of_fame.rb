class AddDetailsToHallOfFame < ActiveRecord::Migration[7.0]
  def change
    add_column :hall_of_fames, :goals, :string
    add_column :hall_of_fames, :saves, :string
    add_column :hall_of_fames, :blocks, :string
  end
end
