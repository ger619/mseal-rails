class AddUserOpponentTeam < ActiveRecord::Migration[7.0]

    def change
      add_reference :opponent_teams, :user, type: :uuid, foreign_key: true
    end
end
