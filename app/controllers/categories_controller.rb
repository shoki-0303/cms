class CategoriesController < ApplicationController
  include CallCategories
  include CallTags
  before_action :set_category, only: [:show, :edit, :update]

  def index
    call_categories
  end

  def show
    call_categories
    call_tags_popular20
    @tags = Tag.joins(:article_tags).group(:tag_id).order('count(article_id) desc').limit(20)
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
end
