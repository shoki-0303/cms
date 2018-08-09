class ArticlesController < ApplicationController
  include CallCategories
  include CallTags
  def index
    @articles = Article.where(release: true).order("created_at DESC")
    call_categories
    call_tags_popular20
  end

  def show
    @article = Article.find(params[:id])
    @article_tags = @article.tags
    call_categories
    call_tags_popular20
  end
end
