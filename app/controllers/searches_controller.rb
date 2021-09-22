class SearchesController < ApplicationController

  def search
    @posts = Post.searchtaste(params[:taste1])
    @keyword = params[:taste1]
    render "posts/index"
  end

end
