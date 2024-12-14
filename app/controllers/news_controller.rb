class NewsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource except: %i[index show]

  def index
    # Adding a group by month on the news
    # Source:
    #
    @pagy, @news = if params[:query].present?
                     pagy_countless(
                       News.where('type_of_news ILIKE ?', "%#{params[:query]}%").includes(image_attachment: :blob).order('created_at DESC'), items: 8
                     )
                   else
                     pagy_countless(News.includes(image_attachment: :blob).all.order('created_at DESC'), items: 8)
                   end
    respond_to do |format|
      format.html
      format.turbo_stream
    end
    @advert = Advert.all.order('created_at DESC')
  end

  def show
    @news = News.find(params[:id])
    @similar_news = News.where(type_of_news: @news.type_of_news).where.not(id: @news.id).limit(5)
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    @news.user_id = current_user.id

    respond_to do |format|
      if @news.save
        format.html { redirect_to news_url(@news), notice: 'News was successfully created.' }
      else
        format.html { redirect_to news_index_url, notice: 'Failure' }
      end
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.delete
    respond_to do |format|
      format.html { redirect_to news_index_path, notice: 'News was successfully deleted.' }
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to news_url(@news.id), notice: 'News was successfully updated.' }
      else
        format.html { redirect_to news_index_url, notice: 'Failure' }
      end
    end
  end

  private

  def news_params
    params.require(:news).permit(:type_of_news, :header_news, :content, :image, :user_id)
  end
end
