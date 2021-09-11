class PostsController < ApplicationController

  def index
    @posts = Posts.all
  end

 def new
   @posts = Post.new
 end


private

  def post_params
    params.require(:post).permit(:shop_name, :address, :post_image)
  end


end
