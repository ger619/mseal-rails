class CreateRemoveImageFromNews < ActiveRecord::Migration[7.0]
  def change
    remove_column :news, :image, :string
  end

end
