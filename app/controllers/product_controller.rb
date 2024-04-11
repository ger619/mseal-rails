class ProductController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    params[:product][:images] do |image|
      mini_image = MiniMagick::Image.new(image.tempfile.path)
      mini_image.resize '640x480'
    end

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_index_path(@product), notice: 'Product was successfully created.' }
      else
        format.html { redirect_to product_index_path, notice: 'Failure' }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_index_path(@product), notice: 'Product was successfully updated.' }
      else
        format.html { redirect_to product_index_path, notice: 'Failure' }
      end
    end
  end

  def destroy
    @product.delete

    respond_to do |format|
      format.html { redirect_to product_url, notice: 'Product was successfully deleted.' }
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :description, :quantity, :price, :photo_product, :user_id)
  end
end
