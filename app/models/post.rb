class Post < ActiveRecord::Base
  has_many :comments
  has_many :videos
  has_many :post_views

  belongs_to :author, class_name: 'User'
  belongs_to :sport

  accepts_nested_attributes_for :videos
  acts_as_votable

  validates :sport, presence: true
  validates :content, presence: true
  validates :title, presence: true

  include Votable

  scope :is_public, -> { where(is_public: true) }
  scope :by_sport, ->(sport) { where(sport: sport) }
  scope :viewed_by, ->(user) { PostView.where(user: user).map { |pv| pv.post } }

  def viewed_by(user)
    if post_view = PostView.find_by(user: user, post: self)
      post_view.occurrences += 1
      post_view.touch(:last_accessed)
      post_view.save
    else
      PostView.create(user: user, post: self, occurrences: 1, last_accessed: DateTime.now)
    end
  end
end
