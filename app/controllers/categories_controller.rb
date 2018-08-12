class CategoriesController < ApplicationController
  include CallCategories
  include CallTags
  include CallRankings
  before_action :set_category, only: [:show, :edit, :update]
  before_action :set_categories, only: [:index, :show]
  before_action :set_tags, only: [:show]
  before_action :set_ranking, only: [:show]

  def index
  end

  def show
    @articles = @category.articles
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to drafts_path
    else
      render :edit
    end
  end

  def edit
    redirect_to root_path unless user_signed_in? && current_user.admin_flg == true
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :image, :content)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_categories
    @categories = call_categories
  end

  def set_tags
    @tags = call_tags_popular20
  end

  def set_ranking
    call_rankings_ids
  end
end
