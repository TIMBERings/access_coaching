class Sport < ActiveRecord::Base
  has_many :posts
  has_many :sports_users
  has_many :sports, through: :sports_users

end
