class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.save!

  end

  private

  def product_params
    params.require(:product).permit(:model, :description, :price, :location, :category, :photo)
  end
end
