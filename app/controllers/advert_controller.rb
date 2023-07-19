class AdvertController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @adverts = Advert.all
  end

  def show
    @advert = Advert.find(params[:id])
  end

  def new
    @advert = Advert.new
  end

  def create
    @advert = Advert.new(advert_params)
    @advert.user_id = current_user.id
    respond_to do |format|
      if @advert.save
        format.html { redirect_to advert_index_path(@advert), notice: 'Advert was successfully created.' }
      else
        format.html { redirect_to advert_index_url, notice: 'Failure' }
      end
    end
  end

  def destroy
    @advert = Advert.find(params[:id])
    @advert.delete
    respond_to do |format|
      format.html { redirect_to advert_index_path, notice: 'Advert was successfully deleted.' }
    end
  end

  private

  def advert_params
    params.require(:advert).permit(:type_of_advert, :header_advert, :mobile_image, :desk_image, :user_id)
  end
end
