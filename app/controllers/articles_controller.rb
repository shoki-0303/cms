class ArticlesController < ApplicationController
  def index
    @articles = Article.where(release: true)
  end

  def show
    @article = Article.find(params[:id])
  end
end
