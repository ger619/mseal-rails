class AddSeasonToOpponent < ActiveRecord::Migration[7.0]
  def change
    add_reference :opponents, :season, null: true, foreign_key: true, type: :uuid
  end
end
