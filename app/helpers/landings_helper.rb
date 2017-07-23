module LandingsHelper

  def changed_since_last_accessed(post, user)
    post_view = PostView.find_by(post: post, user: user)
    return unless post_view

    post_view.last_accessed_at < [post.updated_at, post.comments.map(&:updated_at)].flatten.max
  end
end
