class SearchController < ApplicationController
  def index
    @query = Post.ransack(params[:q])
    @posts = @query.result(distinct: true)
    # puts @posts.inspect for testing
  end
end