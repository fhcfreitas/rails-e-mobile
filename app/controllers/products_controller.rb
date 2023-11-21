class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    @product.save

    redirect_to product_path(@restaurant)
  end

  private

  def product_params
    params.require(:product).permit(:user_id, :model, :price, :location, :category)
  end
end
