class DraftsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @article = Article.new
  end

  def create
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :image, :body)
  end
end
