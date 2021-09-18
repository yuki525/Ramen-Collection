class RanksController < ApplicationController
  def index
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def show
    @all_ranks = Post.find(Evaluation.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end
end
