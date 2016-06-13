class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :creator_id

      t.timestamp(null: false)
    end
  end
end
