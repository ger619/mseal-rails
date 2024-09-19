class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @news = News.includes(image_attachment: :blob).order('created_at DESC')
    @advert = Advert.all.order('created_at DESC')
    @opponent1 = Opponent.where('match_date >=?', Date.today).order('match_date ASC')
    @opponent2 = Opponent.where('match_date <= ?', Date.today).where.not(score_one: nil).where.not(score_two: nil).order('match_date DESC')
    @user = User.all

    @per_page = 3
    @page = (params[:page] || 1).to_i
    @total_pages = (Team.count / @per_page.to_f).ceil
    @team = Team.includes(image_attachment: :blob).order('created_at DESC').offset((@page - 1) * @per_page).limit(@per_page)

    respond_to(&:html)
  end
end
