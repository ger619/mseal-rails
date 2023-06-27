class News < ApplicationRecord
  has_one_attached :image

  def recent_news
    @news = News.all.order('created_at DESC').limit(4)
  end
end
