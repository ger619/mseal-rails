class HomeController < ApplicationController
  def index
    @news = News.all.order('created_at DESC').limit(1)
  end


end
