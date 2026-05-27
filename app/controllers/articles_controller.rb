class ArticlesController < ApplicationController
  def new
    @article = Article.new
    @users = User.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def article_params
   params.require(:article).permit(:title, :body, :category, :user_id)
  end
end
