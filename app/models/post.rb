class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :videos
  has_one :user
  acts_as_votable 
end
