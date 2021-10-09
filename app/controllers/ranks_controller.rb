class RanksController < ApplicationController
  def index
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(20).pluck(:post_id)) #いいね数が多い順に投稿を取得
  end

  def show
    #評価が高い順に投稿を取得
    @evaluation = Post.order("evaluation DESC").limit(4)
  end
end
