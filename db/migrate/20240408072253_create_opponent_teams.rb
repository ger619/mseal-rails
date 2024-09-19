class CreateOpponentTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :opponent_teams, id: :uuid do |t|
      t.string :name
      t.string :team_url

      t.timestamps
    end
  end
end
