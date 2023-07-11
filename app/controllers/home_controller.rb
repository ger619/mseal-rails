class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @news = News.all.order('created_at DESC')
    @advert = Advert.all.order('created_at DESC')
  end
end
