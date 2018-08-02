class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false, index: true
      t.text :image, null: false
      t.text :description, null: false
      t.text :body, null: false
      t.boolean :release, null: false, default: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
