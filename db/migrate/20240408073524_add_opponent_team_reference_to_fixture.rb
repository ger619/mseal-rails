class AddOpponentTeamReferenceToFixture < ActiveRecord::Migration[7.0]
  def change
    remove_column :opponents, :opponent
    add_reference :opponents, :opponent_team, foreign_key: true, type: :uuid
  end
end
