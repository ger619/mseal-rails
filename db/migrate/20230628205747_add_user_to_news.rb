class AddUserToNews < ActiveRecord::Migration[7.0]
  def change
    add_reference :news, :user, type: :uuid, null: false, foreign_key: true
  end

end
