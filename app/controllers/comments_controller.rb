class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @articles = Article.all
    @users = User.all
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :article_id)
  end
end
