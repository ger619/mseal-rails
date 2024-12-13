class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @news = News.includes(:image_attachment).all

    # Updated query (without unused associations)
    @news = News.all
    @advert = Advert.all.order('created_at DESC')
    # Display all opponent in ascending order if date is greater than today
    @opponent1 = Opponent.where('match_date >=?', Date.today).order('match_date ASC')
    @opponent2 = Opponent.where('match_date <= ?',
                                Date.today).where.not(score_one: nil).where.not(score_two: nil).order('match_date DESC')
    @product = Product.includes(%i[photo_product_attachment rich_text_content]).order('created_at DESC')

    @user = User.all
    respond_to(&:html)
    @teams = Team.includes(image_attachment: :blob).all.order('jersey_number ASC')
  end
end
