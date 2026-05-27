class DashboardController < ApplicationController
  def index
        @articles = Article.all
        @users = User.all
        @comments = Comment.all
  end
end
