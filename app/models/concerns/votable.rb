module Votable
  include ActiveSupport::Concern

  def total_votes
    get_likes.size - get_dislikes.size
  end

  def cast_vote(direction, user)
    # Make sure we've specified a direction
    raise "No direction specified to cast vote." unless direction

    # Make sure the direction is valid
    unless ["liked", "disliked"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    if user.voted_for? self
      unliked_by(user) if user.voted_as_when_voted_for(self) && direction == 'disliked'
      undisliked_by(user) if !user.voted_as_when_voted_for(self) && direction == 'liked'
    else
      self.send("#{direction}_by", user)
    end
  end
end
