class PostsController < ApplicationController

  before_action :authenticate_customer!, {only: [:show, :new, :new, :edit, :update]}

  def index
    @posts = Post.page(params[:page]).per(9)
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

    if @post.update(post_params) #投稿成功した場合と失敗した場合で条件分岐
      redirect_to users_path
    else
      render "edit"
    end
  end

  def edit
    @post = Post.find(params[:id])

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_path
  end
  
  #ヘッダーの検索機能
  def search
    @posts = Post.search(params[:keyword])
    @posts = @posts.page(params[:page]).per(12)
    @keyword = params[:keyword]
    render "index"
  end
  
  #ストロングパラメーター
  private

  def post_params
    params.require(:post).permit(:shop_name, :address, :introduction, :taste, :noodle_hardness, :evaluation, :post_image)
  end


end
