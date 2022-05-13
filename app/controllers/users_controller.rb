class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @email = current_user.email
        @posts = current_user.posts
    end
end
