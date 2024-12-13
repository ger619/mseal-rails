class CreateHallOfFames < ActiveRecord::Migration[7.0]
  def change
    create_table :hall_of_fames, id: :uuid do |t|
      t.references :team, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
