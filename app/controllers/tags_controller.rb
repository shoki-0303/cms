class TagsController < ApplicationController

  def index
    @tag = Tag.new
    @tags = Tag.order("id ASC")
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
    @tag = Tag.find(params[:id])
    @tag.destroy if current_user.admin_flg == true
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
