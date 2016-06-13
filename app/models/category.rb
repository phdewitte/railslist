class Category < ActiveRecord::Base
  validates_presence_of :title, :creator_id

  has_many :articles
  belongs_to :creator, class_name: "User"
end
