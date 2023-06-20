class NewsController < ApplicationController

  def index
    @news = News.all.order('created_at DESC')
  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to news_index_path(@news), notice: 'News was successfully created.' }
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

  private

  def news_params
    params.require(:news).permit(:type_of_news, :header_news, :body, :image)
  end
end
