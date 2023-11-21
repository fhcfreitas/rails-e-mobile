class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update]

  def index
    @products = Product.all
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product updated", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:model, :description, :price, :location, :category)
  end
end
