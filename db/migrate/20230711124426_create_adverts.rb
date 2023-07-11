class CreateAdverts < ActiveRecord::Migration[7.0]
  def change
    create_table :adverts do |t|
      t.string :type_of_advert
      t.string :header_advert
      t.string :mobile_image
      t.string :desk_image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
