class MoveBodyToActionText < ActiveRecord::Migration[7.0]
  def change
    News.all.find_each do |news|
      news.update(content: news.body)
    end
    remove_column :news, :body
  end
end
