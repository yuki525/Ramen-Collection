class SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "スープの味"
      @posts = Post.searchtaste(params[:taste1])
      @keyword = params[:taste1]
      render "posts/index"
    else
      @posts = Post.searchnoodle(params[:noodle])
      @keyword = params[:noodle]
      render "posts/index"
    end
  end

end
