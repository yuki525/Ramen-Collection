class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_customer.favorites.new(post_id: @post.id)
    @favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = Favorite.find_by(post_id: params[:post_id], customer_id: current_customer.id)
    @favorite.destroy

  end


end
