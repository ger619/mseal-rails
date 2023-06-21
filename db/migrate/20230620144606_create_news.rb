class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :type_of_news
      t.string :header_news
      t.string :body
      t.string :image

      t.timestamps
    end
  end
end
