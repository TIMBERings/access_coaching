class Comment < ActiveRecord::Base
  include Votable

  belongs_to :post
  belongs_to :author, class_name: 'User'
  acts_as_votable

end
