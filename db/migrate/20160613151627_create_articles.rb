class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.integer :price
      t.integer :author_id
      t.integer :category_id

      t.timestamp(null: false)
    end
  end
end
