class Post < ActiveRecord::Base
  has_many :comments
  has_many :videos
  belongs_to :author, class_name: 'User'
  belongs_to :sport
  acts_as_votable
  include Votable

  scope :is_public, -> { where(is_public: true) }

end
