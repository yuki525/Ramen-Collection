class CommentsController < ApplicationController

  def create #コメントを登録する

    @comment = Comment.new(comment_params) #コメントのインスタンスを作成
    @comment.customer_id = current_customer.id
    @comment.save #コメント登録の条件分岐
      redirect_back(fallback_location: root_path)

  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :customer_id)
  end

end
