class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :videos
  has_one :user
end
