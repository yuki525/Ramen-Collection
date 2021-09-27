class SearchesController < ApplicationController

  def search
    @posts = Post.searchtaste(params[:taste1]).page(params[:page]).per(12)
    @keyword = params[:taste1]
    render "posts/index"
  end

end
