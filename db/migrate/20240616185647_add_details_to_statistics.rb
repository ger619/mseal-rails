class AddDetailsToStatistics < ActiveRecord::Migration[7.0]
  def change
    remove_column :statistics, :kpl_appearance, :integer
    remove_column :statistics, :kpl_goal, :integer
    remove_column :statistics, :kpl_yellow, :integer
    remove_column :statistics, :kpl_redcard, :integer
    remove_column :statistics, :fkfcup_appearance, :integer
    remove_column :statistics, :fkfcup_goal, :integer
    remove_column :statistics, :fkfcup_redcard, :integer
    remove_column :statistics, :fkfcup_yellow, :integer
    #General statistics
    add_column :statistics, :matches_played, :integer, default: 0
    add_column :statistics, :minutes_played, :integer, default: 0
    add_column :statistics, :matches_started, :integer, default: 0
    add_column :statistics, :subs, :integer, default: 0
    #Defense statistics
    add_column :statistics, :tackles_won, :integer, default: 0
    add_column :statistics, :tackles_attempted, :integer, default: 0
    add_column :statistics, :duel_won, :integer, default: 0
    add_column :statistics, :duel_attempted, :integer, default: 0
    add_column :statistics, :interception_won, :integer, default: 0
    add_column :statistics, :interception_attempted, :integer, default: 0
    #Distribution statistics
    add_column :statistics, :passes_completed, :integer, default: 0
    add_column :statistics, :passes_attempted, :integer, default: 0
    #Attack Statistics
    add_column :statistics, :shots_on_target, :integer, default: 0
    add_column :statistics, :shots_off_target, :integer, default: 0
    add_column :statistics, :shots_attempted, :integer, default: 0
    add_column :statistics, :goals_scored, :integer, default: 0
    add_column :statistics, :assists, :integer, default: 0
    #Discipline Statistics
    add_column :statistics, :yellow_card, :integer, default: 0
    add_column :statistics, :red_card, :integer, default: 0
    add_column :statistics, :fouls_committed, :integer, default: 0
    add_column :statistics, :fouls_won, :integer, default: 0
  end
end


