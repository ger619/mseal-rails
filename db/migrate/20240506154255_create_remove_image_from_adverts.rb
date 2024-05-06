class CreateRemoveImageFromAdverts < ActiveRecord::Migration[7.0]
  def change
    remove_column :adverts, :mobile_image, :string
    remove_column :adverts, :desk_image, :string
  end
end
