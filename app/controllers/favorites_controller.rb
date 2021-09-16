class FavoritesController < ApplicationController
  def create
   @favorite = current_customer.favorites.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(post_id: params[:post_id], customer_id: current_customer.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end


end
