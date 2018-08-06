class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text   :content, null: false
      t.text   :image, null: false
    end
  end
end
