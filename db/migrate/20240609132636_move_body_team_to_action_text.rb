class MoveBodyTeamToActionText < ActiveRecord::Migration[7.0]
  def change
    Team.all.find_each do |team|
      team.update(content: team.about)
    end
    remove_column :teams, :about
  end
end
