class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @email = current_user.email
        @posts = current_user.posts
    end

    def followings
        @followings = @user.following_users
    end

    def followers
        @followers = @user.follower_users
    end
    
    private

    def set_user
        @user = User.find(params[:id])
    end
end
