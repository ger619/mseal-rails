class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :header
      t.string :body
      t.string :photo

      t.timestamps
    end
  end
end
