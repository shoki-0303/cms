class ArticlesController < ApplicationController
  include CallCategories
  include CallTags
  include CallRankings
  before_action :set_categories, only: [:index, :show]
  before_action :set_tags, only: [:index, :show]
  before_action :set_ranking, only: [:index, :show]

  def index
    @articles = Article.where(release: true).order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
    @article_tags = @article.tags
    REDIS.zincrby "articles/daily/#{Date.today.to_s}", 1, "#{@article.id}"
  end

  private

  def set_categories
    @categories = call_categories
  end

  def set_tags
    @tags = call_tags_popular20
  end

  def set_ranking
    @ranking_articles = Article.where(id: call_rankings_ids)
  end
end
