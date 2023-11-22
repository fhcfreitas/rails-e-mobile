class ProductsController < ApplicationController
   before_action :set_product, only: %i[edit update]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.save
  end

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

  def product_params
    params.require(:product).permit(:model, :description, :price, :location, :category, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
