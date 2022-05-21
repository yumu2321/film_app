class ProfilesController < ApplicationController

    def edit
      @user = User.find(current_user.id)
    end
    
    def update
      @user = User.find(current_user.id)
      if @user.update(user_params)
        redirect_to "/users/#{current_user.id}", success: "ユーザーを更新しました"
      else
        flash.now['danger'] = "ユーザーを更新できませんでした"
        render :edit 
      end
    end
    
    def show
      @profile = User.find(parms[:id])
    end
    
    private
    
    def user_params
      params.require(:user).permit(:email, :nickname, :avatar)
    end
    
end
