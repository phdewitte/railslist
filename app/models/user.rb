class User < ActiveRecord::Base
  has_secure_password
  # the following two validations are included in has_secure_password
  # validates_confirmation_of :password
  # validates_presence_of :password, :on => :create

  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :articles, foreign_key: "author_id"
  has_many :categories, foreign_key: "creator_id"

  # the following three methods are included in has_secure_password
  # def password
  #   @password ||= BCrypt::Password.new(hashed_password)
  # end

  # def password=(new_password)
  #   @password = BCrypt::Password.create(new_password)
  #   self.hashed_password = @password
  # end

  # def authenticate(password)
  #   self.password == password
  # end
end
