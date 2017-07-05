class LandingsController < ApplicationController
  def index
    if current_user&.admin?
      @posts = Post.all
    elsif current_user&.coach? || current_user&.athlete?
      @own_posts = Post.by_sport(current_user.sports).where(author: current_user).flatten.uniq
      @commented_on_posts = Comment.where(author: current_user).map {|c| c.post if c.post.author != current_user}.flatten.compact.uniq
      @empty_posts = Post.by_sport(current_user.sports).select {|p| p.comments.size == 0 && p.author_id != current_user.id}
      @other_posts
    end
  end
end
