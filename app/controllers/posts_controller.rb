class PostsController < ApplicationController
 
  def new
    @post = Post.new
  # 空のOutputインスタンスを生成する
  end
  
  def create
    @post = Post.new(post_params)
  # newページで入力した内容が格納された状態のインスタンスが飛んでくる
    @post.user_id = current_user.id
  # user_idカラムにcurrent_userのidを代入する
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :star, :review)
    end
    
  def edit
   @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to request.referer
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end
  
end
