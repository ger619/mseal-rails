class AddSeasonToTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :tables, :season, null: false, foreign_key: true, type: :uuid
  end
end
