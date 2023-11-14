class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :position
      t.string :image
      t.integer :jersey_number
      t.string :about
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
