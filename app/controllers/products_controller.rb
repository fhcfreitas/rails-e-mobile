class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update show destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product), notice: "Product listing was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user if user_signed_in?
    @rental = Rental.new
  end

  def index
    @products = Product.all
    @products = @products.search_by_location_and_category(params[:location]) if params[:location].present?
    @products = @products.search_by_location_and_category(params[:category]) if params[:category].present?

    # If you want to filter by both location and category when both are present
    if params[:location].present? && params[:category].present?
      @products = @products.search_by_location_and_category(params[:location]).search_by_location_and_category(params[:category])
    end
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

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:model, :description, :price, :location, :category, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
