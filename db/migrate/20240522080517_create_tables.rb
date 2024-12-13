class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :tables, id: :uuid do |t|
      t.integer :mp
      t.integer :w
      t.integer :d
      t.integer :l
      t.integer :gf
      t.integer :ga
      t.references :opponent_team, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
