class ArticlesController < ApplicationController
  include CallCategories
  def index
    @articles = Article.where(release: true).order("created_at DESC")
    call_categories
  end

  def show
    @article = Article.find(params[:id])
    call_categories
  end
end
