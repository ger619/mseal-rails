class ShopController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index; end


  def show;
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user
    respond_to do |format|
      if @shop.save
        format.html { redirect_to shop_index_path(@shop), notice: 'Shop was successfully created.' }
      else
        format.html { redirect_to shop_index_url, notice: 'Failure' }
      end
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.user = current_user
    @shop.delete
    respond_to do |format|
      format.html { redirect_to shop_index_path, notice: 'Shop was successfully deleted.' }
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:product_name, :description, :size, :quantity, :price, :photo)
  end

end