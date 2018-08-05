class DraftsController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Article.includes(:user).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to drafts_path
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :image, :body)
  end
end
