class MoveBodyClubToActionText < ActiveRecord::Migration[7.0]
  def change
    Club.all.find_each do |club|
      club.update(content: club.body)
    end
    remove_column :clubs, :body

  end
end
