class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics, id: :uuid do |t|
      t.integer :kpl_appearance
      t.integer :kpl_goal
      t.integer :kpl_yellow
      t.integer :kpl_redcard
      t.integer :fkfcup_appearance
      t.integer :fkfcup_goal
      t.integer :fkfcup_redcard
      t.integer :fkfcup_yellow
      t.references :team, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
