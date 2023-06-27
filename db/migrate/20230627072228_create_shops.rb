class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :size
      t.string :gender
      t.string :price
      t.string :photo
      t.string :type

      t.timestamps
    end
  end
end
