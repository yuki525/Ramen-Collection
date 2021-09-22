class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(post_params)
    @posts.customer_id = current_customer.id
    if @posts.save #もし保存ができたら以下の処理をする
      redirect_back(fallback_location: root_path)
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer #投稿した人の情報を抽出

    @comments = @post.comments #投稿に関連付けてあるコメントを全取得

    @comment = Comment.new

    @favorite = Favorite.new
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to users_path
  end

  def edit
    @post = Post.find(params[:id])

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_path
  end

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "search"
  end

  private

  def post_params
    params.require(:post).permit(:shop_name, :address, :introduction, :taste, :noodle_hardness, :evaluation, :post_image)
  end


end
