class RentalsController < ApplicationController
  before_action :set_product, except: [:accept, :decline] #, :set_restaurant, only: %i[show edit update destroy accept]

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

  def accept
    # achar o renta pelo id
    @rental = Rental.find(params[:id])
    # atualizar o status para accepted
    @rental.status = "accepted"
    if @rental.save
       flash[:notice] =  "Rental accepted"
    end
  end

  def decline

    @rental = Rental.find(params[:id])
    @rental.status = "declined"
    if @rental.save
      flash[:notice] =  "Rental declined"
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
