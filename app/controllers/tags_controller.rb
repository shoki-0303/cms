class TagsController < ApplicationController
  include CallCategories
  include CallTags
  before_action :only_admin
  before_action :set_tag, only: [:show, :destroy]

  def index
    @tag = Tag.new
    @tags = Tag.order("id ASC")
  end

  def show
    @categories = call_categories
    @tags = call_tags_popular20
    @articles = @tag.articles
  end

  def create
    @tag = Tag.new(tag_params)
    if Tag.where(name: @tag.name).present?
      redirect_to tags_path, notice: 'タグはすでに存在しています'
    elsif @tag.save
      redirect_to tags_path
    else
      render :index
    end
  end

  def destroy
    @tag.destroy if current_user.admin_flg == true
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def only_admin
    redirect_to drafts_path unless current_user.admin_flg == true
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
