module CallCategories
  def call_categories
    @categories = Category.all
  end
end
