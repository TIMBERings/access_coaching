class SportsUser < ActiveRecord::Base
  belongs_to :sport
  belongs_to :user

  validates :sport_id, uniqueness: { :scope => [:user_id] }

end
