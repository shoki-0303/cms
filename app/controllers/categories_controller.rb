class CategoriesController < ApplicationController
  def index
    @categories = Category.all
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

  private

  def category_params
    params.require(:category).permit(:name, :image, :content)
  end
end
