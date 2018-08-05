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

  def edit
    @article = Article.find(params[:id])
    redirect_to drafts_path unless @article.user_id == current_user.id or current_user.admin_flg == true
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
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
