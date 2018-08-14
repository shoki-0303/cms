class AddSlugNameToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :slug_name, :string
  end
end
