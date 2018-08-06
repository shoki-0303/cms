class ArticlesController < ApplicationController
  def index
    @articles = Article.where(release: true)
  end

  def show
  end
end
