class HomeController < ApplicationController
  def index
  	@recent_posts = Post.limit(10).order(created_at: :desc).all
  	@most_commented_posts = Post.joins(:comments).select('posts.*, count(*) as count_post_id').group('posts.id').order('count_post_id DESC').limit(10)
  end

  def newsfeed
  	@posts = Post.order(created_at: :desc).all
  end
end
