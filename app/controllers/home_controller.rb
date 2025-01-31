class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @news = News.includes(image_attachment: :blob).order('created_at DESC')
    @advert = Advert.all.order('created_at DESC')
    # Display all opponent in ascending order if date is greater than today
    @upcoming = Opponent.where('match_date >=?', Date.today).order('match_date ASC')
    @next_match = @upcoming.first&.match_date
    @results = Opponent.where('match_date <= ?',
                              Date.today).where.not(score_one: nil).where.not(score_two: nil).order('match_date DESC')
    @product = Product.includes(photo_product_attachment: :blob).order('created_at DESC')

    @user = User.all
    respond_to(&:html)
    @teams = Team.includes(image_attachment: :blob).all.order('jersey_number ASC')
  end
end
