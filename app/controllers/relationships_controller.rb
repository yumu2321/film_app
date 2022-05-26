class RelationshipsController < ApplicationController
  
  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer  
  end
  
  # def create
  #   user = User.find(params[:follow_id])
  #   current_user.follow(params[:follow_id])
  #   redirect_to user_path(user)
  # end

  # def destroy
  #   Relationship.find_by(follower_id: current_user.id, following_id: params[:id]).destroy
  #   redirect_to user_path
  # end
  
  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
end
