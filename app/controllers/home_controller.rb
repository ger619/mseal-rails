class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @news = News.all.order('created_at DESC')
    @advert = Advert.all.order('created_at DESC')
    # Display all opponent in ascending order if date is greater than today
    @opponent = Opponent.limit(1).order('match_date ASC').where('match_date >= ?', Date.today)
  end
end
