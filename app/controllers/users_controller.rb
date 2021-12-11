class UsersController < ApplicationController

  before_action :authenticate_customer!

  def index
    @user = current_customer
    @posts = @user.posts
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to users_path
    else
      render "edit"
    end
  end

　#ストロングパラメーター

  private

　#ストロングパラメーター
  def customer_params
    params.require(:customer).permit(:name, :postcode, :address, :email, :profile_image)
  end

end
