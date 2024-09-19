class CreateScorers < ActiveRecord::Migration[7.0]
  def change
    create_table :scorers, id: :uuid do |t|
      t.string :name
      t.integer :goals
      t.integer :assists
      t.references :team, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :opponent, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
