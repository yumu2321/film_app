class PostsController < ApplicationController
 
  def create
    @post = Post.new
    @post.user_id
    
  end

  def new
    @post = Post.new
    @posts = Post.all
  end
end
