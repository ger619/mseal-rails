class AddDetailsToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :date_of_birth, :date
    add_column :teams, :mseal_debut, :string
    add_column :teams, :first_goal, :string
    add_column :teams, :previous_club, :string
    add_column :teams, :twitter, :string, default: 'https://x.com/home'
    add_column :teams, :instagram, :string, default: 'https://www.instagram.com/'
  end
end
