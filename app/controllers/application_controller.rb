class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  stale_when_importmap_changes
  before_action :set_query
  def set_query
        @query = Post.ransack(params[:q])
  end 

end
