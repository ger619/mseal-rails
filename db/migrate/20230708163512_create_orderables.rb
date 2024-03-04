class CreateOrderables < ActiveRecord::Migration[7.0]
  def change
    create_table :orderables, id: :uuid do |t|
      t.belongs_to :product, null: false, foreign_key: true, type: :uuid
      t.belongs_to :cart, null: false, foreign_key: true, type: :uuid
      t.string :size
      t.integer :quantity

      t.timestamps
    end
  end
end
