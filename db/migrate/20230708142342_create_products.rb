class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.text :name
      t.string :description
      t.integer :price
      t.string :photo_product

      t.timestamps
    end
  end
end
