class Roles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles, id: :uuid do |t|
      t.string :role

      t.timestamps
    end
  end
end
