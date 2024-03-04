class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops, id: :uuid do |t|
      t.string :product_name
      t.string :description
      t.string :size
      t.string :quantity
      t.string :price
      t.string :photo

      t.timestamps
    end
  end
end
