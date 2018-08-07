class ArticlesController < ApplicationController
  def index
    @articles = Article.where(release: true).order("created_at DESC")
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
    @categories = Category.all
  end
end
