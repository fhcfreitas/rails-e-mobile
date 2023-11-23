class UsersController < ApplicationController

  def profile
    @user = current_user

  end

  def show
    @user = User.find(params[:id])
    @products_list = @user.rented_products.find(params[:id])
  end

end
