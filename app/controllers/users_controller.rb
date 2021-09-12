class UsersController < ApplicationController
  def index
    @user = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to users_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :postcode, :address, :email)
  end

end
