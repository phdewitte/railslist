class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :author_id, :category_id

  belongs_to :author, class_name: "User"
  belongs_to :category
end
