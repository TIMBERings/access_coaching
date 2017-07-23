class LandingsController < ApplicationController
  def index
    if current_user&.admin?
      @posts = Post.all
    elsif current_user&.coach? || current_user&.athlete?
      @own_posts = Post.by_sport(current_user.sports).current_users.flatten.uniq
      @commented_on_posts = Post.commented_on_by_user(current_user)
      @empty_posts = other_owners_posts_without_comments(current_user)
      @other_posts
    end
  end
end
