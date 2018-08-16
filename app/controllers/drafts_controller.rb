class DraftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy, :release]
  def index
    @articles = Article.page(params[:page]).per(ARTICLES_PER_PAGE_NUMBER).includes(:user).order("created_at DESC")
  end

  def new
    @article = Article.new
    @tags = Tag.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
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
    redirect_to drafts_path unless @article.user_id == current_user.id or current_user.admin_flg == true
  end

  def update
    if @article.update(article_params)
      redirect_to drafts_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy if current_user.admin_flg == true
    redirect_to drafts_path
  end

  def release
    @article.update_attributes(release: true) if current_user.admin_flg == true
    redirect_to drafts_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :category_id, :image, :body, {:tag_ids => []})
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
