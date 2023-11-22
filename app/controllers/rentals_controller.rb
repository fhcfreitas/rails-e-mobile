class RentalsController < ApplicationController
  before_action :set_product

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.product = @product
    @rental.user = current_user

    if @rental.save
      redirect_to products_path
    else
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def rental_params
   params.require(:rental).permit(:start_date, :finish_date)
  end
end
