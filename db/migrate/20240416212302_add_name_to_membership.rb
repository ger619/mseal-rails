class AddNameToMembership < ActiveRecord::Migration[7.0]
  def change
    add_column :memberships, :name, :string
  end
end
