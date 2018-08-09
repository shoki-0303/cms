class ArticlesController < ApplicationController
  include CallCategories
  include CallTags
  before_action :set_categories, only: [:index, :show]
  before_action :set_tags, only: [:index, :show]

  def index
    @articles = Article.where(release: true).order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
    @article_tags = @article.tags
  end

  private

  def set_categories
    @categories = call_categories
  end

  def set_tags
    @tags = call_tags_popular20
  end
end
