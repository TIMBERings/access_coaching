class PostView < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :post_id, presence: true, numericality: { only_integer: true }
  validates :last_accessed, presence: true
  validates :occurrences, presence: true, numericality: { only_integer: true }
end
