class ArticlesController < ApplicationController
  include CallCategories
  def index
    @articles = Article.where(release: true).order("created_at DESC")
    call_categories
    @tags = Tag.joins(:article_tags).group(:tag_id).order('count(article_id) desc').limit(20)
  end

  def show
    @article = Article.find(params[:id])
    call_categories
    @tags = Tag.joins(:article_tags).group(:tag_id).order('count(article_id) desc').limit(20)
  end
end
