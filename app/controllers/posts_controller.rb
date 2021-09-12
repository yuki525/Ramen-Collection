class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save #もし保存ができたら以下の処理をする
      redirect_to posts_path
    else
      redirect_to new_post_path
    end

  end


  private

  def post_params
    params.require(:post).permit(:shop_name, :address, :post_image, :introduction, :taste, :noodle_hardness)
  end


end
