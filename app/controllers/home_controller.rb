class HomeController < ApplicationController
  
  def index
    @posts = Post.all
    @post = Post.new
  end
  
  def create
    @post = Post.new
    @post.user_id
    post.save
  end

  def new
    @post = Post.new
    @posts = Post.all
  end
  
end
