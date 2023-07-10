class CartController < ApplicationController
  before_action :authenticate_user!, except: %i[index show add]

  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity.positive?
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity:)
    end
    respond_to do |format|
      format.html { redirect_to product_index_path(@product), notice: 'Product was successfully added to cart.' }
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'cart/cart',
                                                   locals: { cart: @cart }),
                              turbo_stream.replace(@product)]
      end
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to product_index_path(@product), notice: 'Product was deleted.' }
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'cart/cart',
                                                   locals: { cart: @cart }),
                              turbo_stream.remove(params[:id])]
      end
    end
  end
end
